local NBK = _G.NBK
if not NBK then return end

local NUL = LibStub("NerzorsUILib-1.0")

local IgnoreAllChars = NBK:GetModule("IgnoreAllChars")
if not IgnoreAllChars then return end

local CAP       = 50
local ROW_H     = 28
local MAX_NAMES = 10

local function liveJob(charKey, row)
    local job = IgnoreAllChars:GetPlanned(charKey, row.key)
    if job and row.deletedAt and row.deletedAt > (job.at or 0) then return nil end
    return job
end

function IgnoreAllChars:AsRow(key, name, realm, byKey)
    local row = byKey and byKey[key]
    if row then return row end
    local ig = NBK.db and NBK.db.ignore
    return { key = key, name = name, realm = realm, on = {}, gone = {}, onCount = 0, goneCount = 0,
             deletedAt = ig and ig.deleted and ig.deleted[key] }
end

function IgnoreAllChars:PlanTargets(list, opts)
    opts = opts or {}
    local characters = opts.characters or self:GetCharacters()
    local IS = NBK:GetModule("IgnoreSync")
    local targets = {}
    for _, ch in ipairs(characters) do
        if ch.key ~= opts.skip then
            local used
            if ch.current and IS then
                used = #IS:GetIgnoreList()
            else
                used = self:PlannedUse(ch.key, ch.count)
            end
            local t = { char = ch, used = used, free = math.max(0, CAP - used),
                        have = 0, add = {}, noRoom = {} }
            for _, row in ipairs(list) do
                local there
                if ch.current then
                    there = IS and IS:IsIgnored(row.name, row.realm)
                else
                    local job = liveJob(ch.key, row)

                    if job then
                        there = job.op == "add" or row.on[ch.key] == true
                    else
                        there = row.on[ch.key] == true and not row.gone[ch.key]
                    end
                end
                if there then
                    t.have = t.have + 1
                elseif #t.add < t.free then
                    t.add[#t.add + 1] = row
                else
                    t.noRoom[#t.noRoom + 1] = row
                end
            end
            targets[#targets + 1] = t
        end
    end
    return targets
end

function IgnoreAllChars:ApplyTargets(targets, ticked)
    local IS = NBK:GetModule("IgnoreSync")
    if not (IS and targets) then return 0, 0, 0 end
    local done, planned, noRoom = 0, 0, 0
    for _, t in ipairs(targets) do
        if ticked[t.char.key] then
            noRoom = noRoom + #t.noRoom
            if t.char.current then
                local count = #IS:GetIgnoreList()
                for _, row in ipairs(t.add) do
                    if count >= CAP or IS._listFull then
                        noRoom = noRoom + 1
                    elseif IS:Add(row.name, row.realm) then
                        done, count = done + 1, count + 1
                    end
                end
            else
                for _, row in ipairs(t.add) do
                    self:Plan(t.char.key, row, "add")
                    planned = planned + 1
                end
            end
        end
    end
    return done, planned, noRoom
end

local function colored(color, text) return ("|cff%s%s|r"):format(NUL.ToHex(color), text) end

function IgnoreAllChars.CharLabel(ch)
    local hex = ch.class and NBK:GetClassHex(ch.class) or "ffffff"
    return ("|cff%s%s|r"):format(hex, ch.name or "?") .. NBK:RealmSuffix(ch.realm)
end
local charLabel = IgnoreAllChars.CharLabel

local function tickable(t) return not t.isSource and #t.add > 0 end

local function previewText(t)
    local L, c = NBK.L, NUL:GetTheme().colors
    if t.isSource then return colored(c.text.muted, L["(source)"]) end
    if #t.add == 0 then
        if #t.noRoom > 0 then return colored(c.state.warning, L["List full"]) end
        return colored(c.text.muted, L["Nothing new"])
    end
    local parts = { colored(c.accent.primary, L["+%d new"]:format(#t.add)) }
    if t.have > 0 then parts[#parts + 1] = colored(c.text.muted, L["%d already there"]:format(t.have)) end
    if #t.noRoom > 0 then parts[#parts + 1] = colored(c.state.warning, L["%d don't fit"]:format(#t.noRoom)) end
    return table.concat(parts, colored(c.text.muted, ", "))
end

local function nameList(rows)
    local out = {}
    for i, row in ipairs(rows) do
        if i > MAX_NAMES then out[#out + 1] = "..."; break end
        out[#out + 1] = NBK:DisplayName(row.name, row.realm)
    end
    return table.concat(out, ", ")
end

local function rowTooltip(t)
    local L, c = NBK.L, NUL:GetTheme().colors
    local ch = t.char
    local lines = {
        L["Snapshot from %s"]:format(ch.scannedAt and NBK:FormatDateTime(ch.scannedAt) or "-"),
        L["Ignore list: %d / %d"]:format(t.used, CAP),
    }
    if ch.current then lines[#lines + 1] = L["This character"] end
    if ch.stale then
        lines[#lines + 1] = colored(c.state.warning, L["Older than 30 days - log in on this character to update it."])
    end
    if not t.isSource then
        if #t.add > 0 then
            lines[#lines + 1] = " "
            lines[#lines + 1] = L["New: %s"]:format(nameList(t.add))
        end
        if #t.noRoom > 0 then
            lines[#lines + 1] = colored(c.state.warning, L["Don't fit: %s"]:format(nameList(t.noRoom)))
        end
    end
    return table.concat(lines, "\n")
end

function IgnoreAllChars:_TargetDialog(cfg)
    local L, theme = NBK.L, NUL:GetTheme()
    local d = { ticked = {}, targets = {}, entries = {} }

    local function updateFooter()
        local total, chars = 0, 0
        for _, t in ipairs(d.targets) do
            if d.ticked[t.char.key] and tickable(t) then
                total, chars = total + #t.add, chars + 1
            end
        end
        d.total:SetText(L["Total: %d new on %d characters"]:format(total, chars))
        d.okBtn:SetLabel(L[cfg.buttonKey]:format(total))
        d.okBtn:SetEnabled(total > 0)
        local all = true
        for _, t in ipairs(d.targets) do
            if tickable(t) and not d.ticked[t.char.key] then all = false; break end
        end
        d.selAll:SetLabel(all and L["Select none"] or L["Select all"])
    end

    local function toggle(t)
        if not tickable(t) then return end
        d.ticked[t.char.key] = not d.ticked[t.char.key] or nil
        d.list:Refresh()
        updateFooter()
    end

    local function rowBuilder(row)
        local check = NUL:Checkbox(row, { size = "small" })
        check:SetPoint("LEFT", row, "LEFT", 6, 0)
        local name = NUL:CreateLabel(row, { text = "", justifyH = "LEFT", wrap = false })
        name:SetPoint("LEFT", row, "LEFT", 30, 0)
        name:SetWidth(160)
        local used = NUL:CreateLabel(row, { text = "", justifyH = "RIGHT", wrap = false })
        used:SetPoint("LEFT", row, "LEFT", 194, 0)
        used:SetWidth(56)
        local preview = NUL:CreateLabel(row, { text = "", justifyH = "LEFT", wrap = false })
        preview:SetPoint("LEFT", row, "LEFT", 264, 0)
        preview:SetPoint("RIGHT", row, "RIGHT", -6, 0)

        row:HookScript("OnEnter", function(self)
            if self._entry then
                NUL:ShowTooltipMultiline(self, { title = charLabel(self._entry.char), body = rowTooltip(self._entry), anchor = "RIGHT" })
            end
        end)
        row:HookScript("OnLeave", function() NUL:HideTooltip() end)
        row:SetScript("OnClick", function(self)
            if self._entry then toggle(self._entry) end
        end)

        return function(r, t)
            local c = NUL:GetTheme().colors
            r._entry = t
            local ch = t.char
            local label = charLabel(ch)
            if ch.current then label = label .. " " .. colored(c.text.muted, "(" .. L["This character"] .. ")") end
            name:SetText(label)
            used:SetText(("%d / %d"):format(t.used, CAP))
            NUL.SetFontColor(used, (ch.stale or t.used >= CAP) and c.state.warning or c.text.primary)
            preview:SetText(previewText(t))
            local can = tickable(t)
            check:SetChecked(can and d.ticked[ch.key] == true)
            check:EnableMouse(can)
            check:SetAlpha(can and 1 or 0.4)

            check:SetOnChange(function() toggle(t) end)
        end
    end

    local f = NUL:Window({
        name   = cfg.name,
        title  = cfg.title,
        width  = cfg.width or 560, height = cfg.height or 440,
        strata = "DIALOG",
    })
    d.f = f
    local top = cfg.buildTop(d, f.content)

    d.okBtn = NUL:Button(f.content, {
        label = L[cfg.buttonKey]:format(0), width = 120, height = 26, style = "primary",
        onClick = function()
            f:Hide()
            cfg.onApply(d)
        end,
    })
    d.okBtn:SetPoint("BOTTOMRIGHT", 0, 0)
    local cancel = NUL:Button(f.content, {
        label = L["Cancel"], width = 110, height = 26, onClick = function() f:Hide() end,
    })
    cancel:SetPoint("RIGHT", d.okBtn, "LEFT", -6, 0)

    d.selAll = NUL:Button(f.content, {
        label = L["Select all"], width = 110, height = 26,
        onClick = function()
            local all = true
            for _, t in ipairs(d.targets) do
                if tickable(t) and not d.ticked[t.char.key] then all = false; break end
            end
            for _, t in ipairs(d.targets) do
                if tickable(t) then d.ticked[t.char.key] = (not all) or nil end
            end
            d.list:Refresh()
            updateFooter()
        end,
    })
    d.selAll:SetPoint("BOTTOMLEFT", 0, 0)

    d.total = NUL:CreateLabel(f.content, { text = "", wrap = false })
    d.total:SetPoint("LEFT", d.selAll, "RIGHT", 10, 0)
    d.total:SetPoint("RIGHT", cancel, "LEFT", -10, 0)
    d.total:SetJustifyH("LEFT")

    d.list = NUL:ScrollList(f.content, { rowHeight = ROW_H, rowBuilder = rowBuilder })
    d.list.container:SetPoint("TOPLEFT", top, "BOTTOMLEFT", 0, -8)
    d.list.container:SetPoint("BOTTOMRIGHT", d.okBtn, "TOPRIGHT", 0, 10)

    function d:SetTargets(targets, sourceChar, preTick)
        self.targets = targets
        local keep = {}
        for _, t in ipairs(targets) do
            if tickable(t) and (self.ticked[t.char.key] or (preTick and preTick[t.char.key])) then
                keep[t.char.key] = true
            end
        end
        self.ticked = keep
        local entries = {}
        if sourceChar then
            entries[1] = { char = sourceChar, used = sourceChar.count or 0, free = 0,
                           have = 0, add = {}, noRoom = {}, isSource = true }
        end
        for _, t in ipairs(targets) do entries[#entries + 1] = t end
        self.entries = entries
        self.list:SetData(entries)
        updateFooter()
    end

    function d:ClearTicks() self.ticked = {} end

    f:HookScript("OnHide", function() NUL:HideTooltip() end)
    return d
end
