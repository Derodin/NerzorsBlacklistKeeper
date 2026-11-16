local NBK = _G.NBK
if not NBK then return end

local NUL = LibStub("NerzorsUILib-1.0")

local IgnoreAllChars = NBK:GetModule("IgnoreAllChars")
if not IgnoreAllChars then return end

local ui = {}

function IgnoreAllChars:PlanCopy(srcKey, characters, rows)
    characters = characters or self:GetCharacters()
    rows = rows or self:GetRows(characters)
    local ig = NBK.db and NBK.db.ignore
    local src = ig and ig.chars and ig.chars[srcKey]
    local names = src and src.names or {}

    local list = {}
    for _, row in ipairs(rows) do
        if row.on[srcKey] and not row.gone[srcKey] and not row.deleted then
            list[#list + 1] = row
        end
    end
    local function since(row)
        local rec = names[row.key]
        return rec and rec.first or 0
    end
    table.sort(list, function(a, b)
        local sa, sb = since(a), since(b)
        if sa ~= sb then return sa < sb end
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    return { src = srcKey, list = list,
             targets = self:PlanTargets(list, { characters = characters, skip = srcKey }) }
end

function IgnoreAllChars:ApplyCopy(p, ticked)
    if not p then return 0, 0, 0 end
    local L = NBK.L
    local done, planned, noRoom = self:ApplyTargets(p.targets, ticked)
    NBK:Print(L["Copy list - ignored here: %d, planned for other characters: %d"]:format(done, planned))
    if noRoom > 0 then
        NBK:Print(L["Did not fit (ignore list full): %d"]:format(noRoom))
    end
    local core = NBK:GetModule("IgnoreManager")
    if core and core.RefreshTab then core:RefreshTab() else self:Refresh() end
    return done, planned, noRoom
end

local charLabel = IgnoreAllChars.CharLabel

local function setSource(key)
    local chars = IgnoreAllChars:GetCharacters()
    ui.plan = IgnoreAllChars:PlanCopy(key, chars)
    local opts, srcChar = {}, nil
    for _, ch in ipairs(chars) do
        opts[#opts + 1] = { key = ch.key, label = ("%s  (%d)"):format(charLabel(ch), ch.count or 0) }
        if ch.key == key then srcChar = ch end
    end
    ui.from:SetOptions(opts)
    ui.from:SetValue(key)
    ui.fromCount:SetText(NBK.L["%d to copy"]:format(#ui.plan.list))

    ui.d:ClearTicks()
    ui.d:SetTargets(ui.plan.targets, srcChar)
    ui.d.list:ScrollToTop()
end

local function build()
    if ui.d then return ui.d end
    local L = NBK.L
    ui.d = IgnoreAllChars:_TargetDialog({
        name = "NBKIgnoreCopyDialog", title = L["Copy ignore list"],
        buttonKey = "Copy (%d)",
        buildTop = function(d, content)
            local theme = NUL:GetTheme()
            local fromLabel = NUL:CreateLabel(content, { text = L["From:"], wrap = false })
            fromLabel:SetPoint("TOPLEFT", 0, -5)
            ui.from = NUL:Dropdown(content, {
                width = 260, height = 24,
                onSelect = function(key) setSource(key) end,
            })
            ui.from:SetPoint("LEFT", fromLabel, "RIGHT", 8, 0)
            ui.fromCount = NUL:CreateLabel(content, { text = "", color = theme.colors.text.muted, wrap = false })
            ui.fromCount:SetPoint("LEFT", ui.from, "RIGHT", 10, 0)
            local hint = NUL:CreateLabel(content, {
                text = L["Adds the players ignored on the source to the ticked characters. Nothing is removed there. On this character it happens right away, on the others at their next login."],
                size = "sm", color = theme.colors.text.muted, justifyH = "LEFT",
            })
            hint:SetPoint("TOPLEFT", 0, -34)
            hint:SetPoint("RIGHT", content, "RIGHT", 0, 0)
            return hint
        end,
        onApply = function(d) IgnoreAllChars:ApplyCopy(ui.plan, d.ticked) end,
    })
    return ui.d
end

function IgnoreAllChars:ShowCopyDialog(srcKey)
    local L = NBK.L
    local characters = self:GetCharacters()
    if #characters < 2 then
        NBK:Print(L["Copying needs a second character - log in on it once first."])
        return
    end
    if not srcKey then
        for _, ch in ipairs(characters) do
            if (ch.count or 0) > 0 then srcKey = ch.key; break end
        end
    end
    if not srcKey then
        NBK:Print(L["No character has anyone on its ignore list yet."])
        return
    end
    local d = build()
    setSource(srcKey)
    d.f:Show()
end
