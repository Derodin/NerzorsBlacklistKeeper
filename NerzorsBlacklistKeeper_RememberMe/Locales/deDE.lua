local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("deDE", {
    ["Remembered"]             = "Gemerkt",

    ["Add to Remember Me"]      = "Zu Merken hinzufügen",
    ["Edit Remember Me entry"]  = "Merken-Eintrag bearbeiten",
    ["Remove from Remember Me"] = "Aus Merken entfernen",
    ["Remove %s from Remember Me?"] = "%s aus Merken entfernen?",

    ["Rating"]         = "Bewertung",
    ["Default rating"] = "Standard-Bewertung",
    ["%d ★"]           = "%d ★",

    ["Show in unit tooltips"]     = "Im Spieler-Tooltip anzeigen",
    ["Prompt after Mythic+ runs"] = "Nach Mythic+-Runs nachfragen",
    ["Ask when I leave a group"] = "Nachfragen, wenn ich eine Gruppe verlasse",
    ["Ask when someone leaves the group"] = "Nachfragen, wenn jemand die Gruppe verlässt",
    ["Also in raids (when someone leaves)"] = "Auch im Schlachtzug (wenn jemand geht)",
    ["Clear Remember Me..."]      = "Merken-Liste löschen...",
    ["Clear all %d Remember Me entries?"] = "Alle %d Merken-Einträge löschen?",
    ["Cleared %d Remember Me entries."]   = "%d Merken-Einträge gelöscht.",

    ["No entries yet - finish a Mythic+ run to remember your party-mates."]
        = "Noch keine Einträge - schließe einen Mythic+-Run ab, um Gruppenmitglieder zu merken.",
    ["No entries yet - right-click a player or rate your group to remember them."]
        = "Noch keine Einträge - merk dir Spieler per Rechtsklick oder bewerte deine Gruppe.",

    ["Mythic+ run finished"] = "Mythic+-Run abgeschlossen",
    ["%s +%d - %s"]          = "%s +%d - %s",
    ["timed"]                = "im Limit",
    ["depleted"]             = "über Zeit",
    ["Run"]                  = "Lauf",
    ["Rate your party-mates"] = "Bewerte deine Gruppe",

    ["Rate group"] = "Gruppe bewerten",
    ["Rate the players in your party. Only in a party - not alone and not in a raid."]
        = "Bewerte die Spieler deiner Gruppe. Nur in einer Gruppe - nicht allein und nicht im Schlachtzug.",

    ["%s is on the Blacklist. Remove from Blacklist?"]
        = "%s steht auf der Sperrliste. Von der Sperrliste entfernen?",
    ["%s is in Remember Me. Remove from Remember Me?"]
        = "%s ist in Merken. Aus Merken entfernen?",

    ["Added %s-%s to Remember Me."]   = "%s-%s zu Merken hinzugefügt.",
    ["Removed %s-%s from Remember Me."] = "%s-%s aus Merken entfernt.",

    ["invalid name/realm"]            = "ungültiger Name/Realm",
})
