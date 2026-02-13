function main()
    while not isSampAvailable() do wait(100) end
    
    local piska = false
    
    sampAddChatMessage("{2CDDDC}« Auto Belt » {FFFFFF}Загружен!", -1)
	sampAddChatMessage("{2CDDDC}« Auto Belt » {FFFFFF}Автор: {2CDDDC}Luffich ", -1)
	sampAddChatMessage("{2CDDDC}« Auto Belt » {FFFFFF}Ремень будет пристегиваться автоматически.", -1)
    
    while true do
        wait(100)
        
        local playerPed = PLAYER_PED
        local siski = isCharInAnyCar(playerPed)
        
        if siski and not piska then
            lua_thread.create(function()
                wait(1000)
                
                setVirtualKeyDown(0x4A, true)
                wait(50)
                setVirtualKeyDown(0x4A, false)
				
            end)
        end
        
        piska = siski
    end
end