-- выяснить какой банк был подключен перед выполнением 0x006282
-- конвертация в 0x01FDD0


-- подготовить таблицы
local tbl = {}
local convert = {
    [0x00] = "01", -- 32
    [0x01] = "05", -- 3A
    [0x02] = "01", -- 32
    [0x03] = "05", -- 3A
    [0x04] = "04", -- 38
    [0x05] = "04", -- 38
    [0x06] = "02", -- 34
    [0x07] = "02", -- 34
}



-- вввести консоль список банков для соответствующих индексов
local function Exit()
    for v = 0x00, 0x7F do
        if tbl[v] == nil then
            print(string.format("%02X", v).." = ??")        -- если не был залогирован
        else
            print(string.format("%02X", v).." = "..tbl[v])  -- если был залогирован
        end
    end
end



-- сработал execute бряк
local function Break()
    local a = memory.getregister("a")           -- прочитать текущий регистр A
    local ram_0050 = memory.readbyte(0x0050)    -- прочитать байт в 0050
    local bank = convert[ram_0050]              -- сконвертировать байт из 0050 в привычный мне номер банка из названия файла
    tbl[a] = bank                               -- записать номер банка для текущего A
end



-- начало основного скрипта
-- бесконечный цикл
while true do
    memory.registerexecute(0xA258, Break)       -- execute бряк
    emu.registerexit(Exit)                      -- выполнить последнюю функцию при нажатии кнопки Stop
    emu.frameadvance()                          -- продвинуться на следующий кадр
end