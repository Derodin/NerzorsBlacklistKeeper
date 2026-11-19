local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("frFR", {

    ["Remembered"]                   = "Favori",

    ["Add to Remember Me"]           = "Ajouter aux favoris",
    ["Edit Remember Me entry"]       = "Modifier le favori",
    ["Remove from Remember Me"]      = "Retirer des favoris",
    ["Remove %s from Remember Me?"] = "Retirer %s des favoris ?",

    ["Rating"]                       = "Évaluation",
    ["Default rating"]               = "Évaluation par défaut",
    ["%d ★"]                         = "%d ★",

    ["Show in unit tooltips"]        = "Afficher dans les infobulles",
    ["Prompt after Mythic+ runs"]    = "Proposer après les donjons mythiques +",
    ["Ask when I leave a group"] = "Demander quand je quitte un groupe",
    ["Ask when someone leaves the group"] = "Demander quand quelqu'un quitte le groupe",
    ["Also in raids (when someone leaves)"] = "Aussi en raid (quand quelqu'un part)",
    ["Clear Remember Me..."]         = "Vider les favoris...",
    ["Clear all %d Remember Me entries?"] = "Supprimer les %d favoris ?",
    ["Cleared %d Remember Me entries."]   = "Favoris supprimés : %d.",

    ["No entries yet - finish a Mythic+ run to remember your party-mates."]
        = "Aucune entrée pour l'instant : terminez un donjon mythique + pour retenir vos coéquipiers.",
    ["No entries yet - right-click a player or rate your group to remember them."]
        = "Aucune entrée pour l'instant - faites un clic droit sur un joueur ou évaluez votre groupe pour vous en souvenir.",

    ["Mythic+ run finished"]         = "Donjon mythique + terminé",
    ["%s +%d - %s"]                  = "%s +%d - %s",
    ["timed"]                        = "dans les temps",
    ["depleted"]                     = "hors délai",
    ["Run"]                          = "Clé",
    ["Rate your party-mates"]        = "Évaluez vos coéquipiers",

    ["Rate group"] = "Évaluer le groupe",
    ["Rate the players in your party. Only in a party - not alone and not in a raid."]
        = "Évaluez les joueurs de votre groupe. Uniquement en groupe - ni seul, ni en raid.",

    ["%s is on the Blacklist. Remove from Blacklist?"]   = "%s est sur la liste noire. Le retirer de la liste noire ?",
    ["%s is in Remember Me. Remove from Remember Me?"]   = "%s est dans les favoris. Le retirer des favoris ?",

    ["Added %s-%s to Remember Me."]  = "%s-%s ajouté aux favoris.",
    ["Removed %s-%s from Remember Me."] = "%s-%s retiré des favoris.",

    ["invalid name/realm"]           = "nom/royaume invalide",
})
