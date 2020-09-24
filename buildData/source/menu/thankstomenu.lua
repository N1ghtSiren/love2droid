menu_thanks = {}

function menu_thanks.create(groupID)
    local obj = object.create(groupID)
    
    function obj.ondraw()
        local height = love.graphics.getHeight()
        local width = love.graphics.getWidth()
        local printf = love.graphics.printf
        
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(font_small)

        printf("Music is used under CC BY 3.0 licence: \r\nhttps://creativecommons.org/licenses/by/3.0/ \r\n\r\nTimbre - tweaked loopable excerpt \r\nhttps://freesound.org/people/Timbre/sounds/418852/", width/20, height*0.05, width*0.9)
        --
        printf(getLocalizedString("Back"), width/20, height*0.85, 999)
        --
    end

    function obj.onupdate(dt)

        local textheight = font_main:getHeight()

        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        --vcells
        
        local textwidth = font_main:getWidth(getLocalizedString("Back"))
        local minx = width/20
        if(touches.isInArea(minx, height*0.85, minx+textwidth, height*0.85+textheight))then
            saveSettings()
            obj.perform(false)
            MainMenu.perform(true)
        end
        --

        touches.clear()

        if(love.keyboard.isScancodeDown("acback"))then
            obj.perform(false)
            MainMenu.perform(true)
        end
    end

    function obj.oncreate()
        
    end

    function obj.ondestroy()

    end
    
    return obj
end