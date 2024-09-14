-- делает скриншоты в корневой папке со скриптом

-- надо вручную в роме отключать запись в номер анимации,
-- а также подготовить фоновую палитру в 03E0,X (включая 03F0)

local i = 0x01
local limit = 0x3D
local name = nil

local pos_X = 0x005E -- ram_позиция_x_спрайта_игрока
local pos_Y = 0x00EE -- ram_позиция_y_спрайта_игрока
local anim =  0x009D -- ram_кадр_игрока
local lives = 0x0053 -- ram_жизни



-- зафиксировать перса, удалить жизни и промотать 1 кадр
memory.writebyte(pos_X, 0x80)
memory.writebyte(pos_Y, 0x80)
memory.writebyte(lives, 0x00)
emu.frameadvance()



while true do
    -- продолжать фиксировать перса
    memory.writebyte(pos_X, 0x80)
    memory.writebyte(pos_Y, 0x80)
    
    if i > limit then
        -- просто продолжить
        emu.frameadvance()
    else
        memory.writebyte(anim, i)
        -- промотать 1 кадр чтобы графа обновилась
        emu.frameadvance()
        
        name = string.format("%02X", i)
        gui.savescreenshotas(name..".png")
        i = i + 1
    end
    
end