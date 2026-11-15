local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("deDE", {
    ["Recent party-mates"] = "Letzte Gruppenmitglieder",
    ["Tracks the last %d unique party-mates (party only - not raid)."]
                           = "Speichert die letzten %d Gruppenmitglieder (nur Party - keine Raids).",
    ["Recents (%d / %d)"]  = "Letzte (%d / %d)",

    ["Storage"]         = "Speicherort",
    ["Account-wide"]    = "Account-weit",
    ["Per-character"]   = "Pro Charakter",
    ["Maximum entries"] = "Maximale Einträge",

    ["Remove from recents"]            = "Aus Letzte entfernen",
    ["Remove %s from recents?"]     = "%s aus Letzte entfernen?",
    ["Clear recents..."]               = "Letzte löschen...",
    ["Clear all %d recents entries?"]  = "Alle %d Letzte-Einträge löschen?",
    ["Cleared %d recents entries."]    = "%d Letzte-Einträge gelöscht.",
    ["No recent group members yet. Players you were in a party with show up here."] = "Noch keine letzten Gruppenmitglieder. Spieler, mit denen du in einer Gruppe warst, erscheinen hier.",
})
