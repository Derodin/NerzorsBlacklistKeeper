local NBK = _G.NBK
if not NBK then return end

NBK:RegisterLocaleStrings("ruRU", {

    ["Remembered"]                   = "В избранном",

    ["Add to Remember Me"]           = "Добавить в избранное",
    ["Edit Remember Me entry"]       = "Изменить запись избранного",
    ["Remove from Remember Me"]      = "Удалить из избранного",
    ["Remove %s from Remember Me?"] = "Удалить %s из избранного?",

    ["Rating"]                       = "Оценка",
    ["Default rating"]               = "Оценка по умолчанию",
    ["%d ★"]                         = "%d ★",

    ["Show in unit tooltips"]        = "Показывать в подсказках",
    ["Prompt after Mythic+ runs"]    = "Предлагать оценку после «Эпохального+»",
    ["Ask when I leave a group"] = "Спрашивать, когда я покидаю группу",
    ["Ask when someone leaves the group"] = "Спрашивать, когда кто-то покидает группу",
    ["Also in raids (when someone leaves)"] = "Также в рейде (когда кто-то уходит)",
    ["Clear Remember Me..."]         = "Очистить избранное...",
    ["Clear all %d Remember Me entries?"] = "Удалить все записи избранного (%d)?",
    ["Cleared %d Remember Me entries."]   = "Удалено записей избранного: %d.",

    ["No entries yet - finish a Mythic+ run to remember your party-mates."]
        = "Записей пока нет: пройдите «Эпохальный+», чтобы запомнить союзников по группе.",
    ["No entries yet - right-click a player or rate your group to remember them."]
        = "Пока нет записей - щёлкните правой кнопкой по игроку или оцените группу, чтобы запомнить его.",

    ["Mythic+ run finished"]         = "«Эпохальный+» пройден",
    ["%s +%d - %s"]                  = "%s +%d - %s",
    ["timed"]                        = "в срок",
    ["depleted"]                     = "не в срок",
    ["Run"]                          = "Ключ",
    ["Rate your party-mates"]        = "Оцените союзников по группе",

    ["Rate group"] = "Оценить группу",
    ["Rate the players in your party. Only in a party - not alone and not in a raid."]
        = "Оцените игроков своей группы. Только в группе - не в одиночку и не в рейде.",

    ["%s is on the Blacklist. Remove from Blacklist?"]   = "%s в блэклисте. Удалить из блэклиста?",
    ["%s is in Remember Me. Remove from Remember Me?"]   = "%s в избранном. Удалить из избранного?",

    ["Added %s-%s to Remember Me."]  = "%s-%s добавлен в избранное.",
    ["Removed %s-%s from Remember Me."] = "%s-%s удалён из избранного.",

    ["invalid name/realm"]           = "неверное имя или сервер",
})
