local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("itIT", {
    ["Recent party-mates"]                                      = "Compagni di gruppo recenti",
    ["Tracks the last %d unique party-mates (party only - not raid)."]
        = "Tiene traccia degli ultimi %d compagni di gruppo diversi (solo gruppo, non incursioni).",
    ["Recents (%d / %d)"]                                       = "Gruppi recenti (%d / %d)",

    ["Storage"]         = "Salvataggio",
    ["Account-wide"]    = "Per tutto l'account",
    ["Per-character"]   = "Per personaggio",
    ["Maximum entries"] = "Numero massimo di voci",

    ["Remove from recents"]                  = "Rimuovi dai recenti",
    ["Remove %s from recents?"]           = "Rimuovere %s dai recenti?",
    ["Clear recents..."]                     = "Svuota i recenti...",
    ["Clear all %d recents entries?"]        = "Eliminare tutte le %d voci recenti?",
    ["Cleared %d recents entries."]          = "Voci recenti eliminate: %d.",
    ["No recent group members yet. Players you were in a party with show up here."] = "Ancora nessun membro di gruppo recente. I giocatori con cui sei stato in gruppo compaiono qui.",
})
