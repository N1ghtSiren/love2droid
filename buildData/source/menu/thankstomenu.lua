menu_thanks = {}

function menu_thanks.create(groupID)
    local obj = object.create(groupID)
    
    function obj.ondraw()
        local height = love.graphics.getHeight()
        local width = love.graphics.getWidth()
        local printf = love.graphics.printf
        
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(font_small)

        printf("Background music is just a remix of part of Frankum's #418321", width/20, height*0.05, width*0.9)
        printf("https://freesound.org/people/frankum/sounds/418321/", width/20, height*0.25, width*0.9)
        printf("Frankum's original has a license which allows commercial-use,", width/20, height*0.45, width*0.9)
        printf("if they receive attribution; licence:", width/20, height*0.65, width*0.9)
        printf("https://creativecommons.org/licenses/by/3.0/", width/20, height*0.75, width*0.9)
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