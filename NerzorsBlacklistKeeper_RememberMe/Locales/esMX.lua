local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("esMX", {

    ["Remembered"]                   = "Favorito",

    ["Add to Remember Me"]           = "Añadir a Favoritos",
    ["Edit Remember Me entry"]       = "Editar favorito",
    ["Remove from Remember Me"]      = "Quitar de Favoritos",
    ["Remove %s from Remember Me?"] = "¿Quitar a %s de Favoritos?",

    ["Rating"]                       = "Valoración",
    ["Default rating"]               = "Valoración predeterminada",
    ["%d ★"]                         = "%d ★",

    ["Show in unit tooltips"]        = "Mostrar en las descripciones emergentes",
    ["Prompt after Mythic+ runs"]    = "Preguntar tras los calabozos míticos+",
    ["Ask when I leave a group"] = "Preguntar cuando salga de un grupo",
    ["Ask when someone leaves the group"] = "Preguntar cuando alguien salga del grupo",
    ["Also in raids (when someone leaves)"] = "También en bandas (cuando alguien sale)",
    ["Clear Remember Me..."]         = "Vaciar Favoritos...",
    ["Clear all %d Remember Me entries?"] = "¿Borrar los %d favoritos?",
    ["Cleared %d Remember Me entries."]   = "Favoritos borrados: %d.",

    ["No entries yet - finish a Mythic+ run to remember your party-mates."]
        = "Aún no hay entradas: completa un calabozo mítico+ para recordar a tus compañeros de grupo.",
    ["No entries yet - right-click a player or rate your group to remember them."]
        = "Aún no hay entradas: haz clic derecho en un jugador o valora a tu grupo para recordarlo.",

    ["Mythic+ run finished"]         = "Calabozo mítico+ completado",
    ["%s +%d - %s"]                  = "%s +%d - %s",
    ["timed"]                        = "a tiempo",
    ["depleted"]                     = "fuera de tiempo",
    ["Run"]                          = "Llave",
    ["Rate your party-mates"]        = "Valora a tus compañeros de grupo",

    ["Rate group"] = "Valorar al grupo",
    ["Rate the players in your party. Only in a party - not alone and not in a raid."]
        = "Valora a los jugadores de tu grupo. Solo en grupo, no a solas ni en banda.",

    ["%s is on the Blacklist. Remove from Blacklist?"]   = "%s está en la lista negra. ¿Quitarlo de la lista negra?",
    ["%s is in Remember Me. Remove from Remember Me?"]   = "%s está en Favoritos. ¿Quitarlo de Favoritos?",

    ["Added %s-%s to Remember Me."]  = "%s-%s añadido a Favoritos.",
    ["Removed %s-%s from Remember Me."] = "%s-%s quitado de Favoritos.",

    ["invalid name/realm"]           = "nombre/reino no válido",
})
