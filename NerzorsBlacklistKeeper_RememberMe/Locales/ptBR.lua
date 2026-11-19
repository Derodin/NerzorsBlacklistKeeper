local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("ptBR", {

    ["Remembered"]                   = "Favorito",

    ["Add to Remember Me"]           = "Adicionar aos Favoritos",
    ["Edit Remember Me entry"]       = "Editar favorito",
    ["Remove from Remember Me"]      = "Remover dos Favoritos",
    ["Remove %s from Remember Me?"] = "Remover %s dos Favoritos?",

    ["Rating"]                       = "Avaliação",
    ["Default rating"]               = "Avaliação padrão",
    ["%d ★"]                         = "%d ★",

    ["Show in unit tooltips"]        = "Mostrar nas dicas",
    ["Prompt after Mythic+ runs"]    = "Perguntar após masmorras Míticas+",
    ["Ask when I leave a group"] = "Perguntar quando eu sair de um grupo",
    ["Ask when someone leaves the group"] = "Perguntar quando alguém sair do grupo",
    ["Also in raids (when someone leaves)"] = "Também em raides (quando alguém sai)",
    ["Clear Remember Me..."]         = "Limpar Favoritos...",
    ["Clear all %d Remember Me entries?"] = "Apagar todos os %d favoritos?",
    ["Cleared %d Remember Me entries."]   = "Favoritos apagados: %d.",

    ["No entries yet - finish a Mythic+ run to remember your party-mates."]
        = "Ainda não há entradas: conclua uma masmorra Mítica+ para lembrar dos seus colegas de grupo.",
    ["No entries yet - right-click a player or rate your group to remember them."]
        = "Ainda não há entradas - clique com o botão direito em um jogador ou avalie seu grupo para lembrá-lo.",

    ["Mythic+ run finished"]         = "Masmorra Mítica+ concluída",
    ["%s +%d - %s"]                  = "%s +%d - %s",
    ["timed"]                        = "no tempo",
    ["depleted"]                     = "fora do tempo",
    ["Run"]                          = "Chave",
    ["Rate your party-mates"]        = "Avalie seus colegas de grupo",

    ["Rate group"] = "Avaliar o grupo",
    ["Rate the players in your party. Only in a party - not alone and not in a raid."]
        = "Avalie os jogadores do seu grupo. Só em grupo - nem sozinho, nem em raide.",

    ["%s is on the Blacklist. Remove from Blacklist?"]   = "%s está na lista negra. Remover da lista negra?",
    ["%s is in Remember Me. Remove from Remember Me?"]   = "%s está nos Favoritos. Remover dos Favoritos?",

    ["Added %s-%s to Remember Me."]  = "%s-%s adicionado aos Favoritos.",
    ["Removed %s-%s from Remember Me."] = "%s-%s removido dos Favoritos.",

    ["invalid name/realm"]           = "nome/reino inválido",
})
