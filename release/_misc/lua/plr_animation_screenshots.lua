-- делает скриншоты в корневой папке со скриптом

-- надо вручную в роме отключать запись в номер анимации

local i = 0x01
local limit = 0x3D
local name = ""



while true do
    -- зафиксировать перса
    memory.writebyte(0x0532, 0x80)
    memory.writebyte(0x054C, 0x80)
    
    if i > limit then
        -- просто продолжить
        emu.frameadvance()
    else
        memory.writebyte(0x0518, i)
        -- промотать 1 кадр чтобы графа обновилась
        emu.frameadvance()
        
        name = string.format("%02X", i)
        gui.savescreenshotas(name..".png")
        i = i + 1
    end
    
end