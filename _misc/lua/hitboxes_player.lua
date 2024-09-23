local hitbox_data                       = 0x026010

local ram_plr_hitbox                    = 0x00C6 -- ram_хитбоксы_игрока
local ram_obj_hitbox                    = 0x6480 -- ram_хитбоксы_объектов

local ram_bul_anim                      = 0x6000 -- ram_кадр_пули_игрока
local ram_obj_anim                      = 0x6020 -- ram_кадр_врага_и_пуль
local ram_obj_id                        = 0x65C0 -- ram_тип_объектов

local ram_plr_pos_X                     = 0x005E -- ram_позиция_x_спрайта_игрока
local ram_plr_pos_Y                     = 0x00EE -- ram_позиция_y_спрайта_игрока
local ram_bul_pos_X                     = 0x6040 -- ram_позиция_x_спрайта_пули_игрока
local ram_bul_pos_Y                     = 0x6080 -- ram_позиция_y_спрайта_пули_игрока
local ram_obj_pos_X                     = 0x6060 -- ram_позиция_x_спрайта_врага_и_пуль
local ram_obj_pos_Y                     = 0x60A0 -- ram_позиция_y_спрайта_врага_и_пуль

local obj_cnt                           = 0x0D   -- количество объектов (враги и пули)



local player_hitbox
local object_hitbox
local X_1
local X_2
local Y_1
local Y_2



local function GetHitbox(position, offset)
    -- вычислить поинтер на основе индексов хитбоксов
    local pointer = (player_hitbox + 0x01) % 0x100 + object_hitbox
    -- получить размер хитбокса из таблицы
    local box_start = (position + rom.readbyte(hitbox_data + pointer + offset)) % 0x100 + 1
    local box_size = rom.readbyte(hitbox_data + pointer + offset + 0x02)
    -- вычислить положение хитбокса на экране
    local pos_start = box_start
    local pos_end = box_start + box_size
    
    --[[
    -- добавить дополнительный символ "-" перед "--" на строке выше для раскомментирования
    print(string.format("player_hitbox = 0x%02X", player_hitbox))
    print(string.format("object_hitbox = 0x%02X", object_hitbox))
    print(string.format("pointer       = 0x%02X", pointer + offset))
    print(string.format("data address  = 0x%06X", hitbox_data + pointer))
    print(string.format("position      = 0x%02X", position))
    print(string.format("box_start     = 0x%02X", box_start))
    print(string.format("box_size      = 0x%02X", box_size))
    print(string.format("pos_start     = 0x%02X", pos_start))
    print(string.format("pos_end       = 0x%02X", pos_end))
    print()
    --]]
    
    -- отправить инфу
    return pos_start, pos_end
end



while true do
    -- получить индекс хитбокса игрока
    player_hitbox = memory.readbyte(ram_plr_hitbox)
    -- если у игрока есть хитбокс
    if player_hitbox ~= 0x00 then
        -- вычислить координаты хитбокса объекта
        X_1 = memory.readbyte(ram_plr_pos_X)
        X_2 = memory.readbyte(ram_plr_pos_X)
        Y_1 = memory.readbyte(ram_plr_pos_Y)
        Y_2 = memory.readbyte(ram_plr_pos_Y)
        -- отрисовать хитбокс игрока (внешний квадрат)
        gui.drawbox(X_1 - 2, Y_1 - 2, X_2 + 2, Y_2 + 2, "white", "purple")
        -- отрисовать хитбокс игрока (точка)
        gui.drawbox(X_1, Y_1, X_2, Y_2, "clear", "red")
        -- отрисовка хитбоксов объектов
        for j = 0, obj_cnt do
            -- если объект существует и если он видимый
            if memory.readbyte(ram_obj_id + j) ~= 0x7F and memory.readbyte(ram_obj_anim + j) ~= 0x00 then
                -- получить индекс хитбокса объекта
                object_hitbox = memory.readbyte(ram_obj_hitbox + j)
                -- вычислить координаты хитбокса объекта
                X_1, X_2 = GetHitbox(memory.readbyte(ram_obj_pos_X + j), 0x01)
                Y_1, Y_2 = GetHitbox(memory.readbyte(ram_obj_pos_Y + j), 0x00)
                -- отрисовать хитбокс объекта
                gui.drawbox(X_1 - 1, Y_1, X_2, Y_2 + 1, "clear", "cyan")
            end
        end
    end
    -- промотать 1 кадр
    emu.frameadvance()
end