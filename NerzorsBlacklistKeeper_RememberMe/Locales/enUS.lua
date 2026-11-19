local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("enUS", {

    ["Remembered"]                   = true,

    ["Add to Remember Me"]           = true,
    ["Edit Remember Me entry"]       = true,
    ["Remove from Remember Me"]      = true,
    ["Remove %s from Remember Me?"] = true,

    ["Rating"]                       = true,
    ["Default rating"]               = true,
    ["%d ★"]                         = true,

    ["Show in unit tooltips"]        = true,
    ["Prompt after Mythic+ runs"]    = true,
    ["Ask when I leave a group"] = true,
    ["Ask when someone leaves the group"] = true,
    ["Also in raids (when someone leaves)"] = true,
    ["Clear Remember Me..."]         = true,
    ["Clear all %d Remember Me entries?"] = true,
    ["Cleared %d Remember Me entries."]   = true,

    ["No entries yet - finish a Mythic+ run to remember your party-mates."] = true,
    ["No entries yet - right-click a player or rate your group to remember them."] = true,

    ["Mythic+ run finished"]         = true,
    ["%s +%d - %s"]                  = true,
    ["timed"]                        = true,
    ["depleted"]                     = true,
    ["Run"]                          = true,
    ["Rate your party-mates"]        = true,

    ["Rate group"]                   = true,
    ["Rate the players in your party. Only in a party - not alone and not in a raid."] = true,

    ["%s is on the Blacklist. Remove from Blacklist?"]   = true,
    ["%s is in Remember Me. Remove from Remember Me?"]   = true,

    ["Added %s-%s to Remember Me."]  = true,
    ["Removed %s-%s from Remember Me."] = true,

    ["invalid name/realm"]           = true,
}, true)
