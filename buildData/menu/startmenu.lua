menu_startgame = {}

function menu_startgame.create(groupID)
    local obj = object.create(groupID)
    
    function obj.ondraw()
        local height = love.graphics.getHeight()
        local width = love.graphics.getWidth()
        local printf = love.graphics.printf
        
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(font_main)
        local locstr = ls_ShortGame
        printf(locstr, width/20, height*0.1, 999)
        --
        locstr = ls_MediumGame
        printf(locstr, width/20, height*0.3, 999)
        --
        locstr = ls_LongGame
        printf(locstr, width/20, height*0.5, 999)
        --
        locstr = ls_Back
        printf(locstr, width/20, height*0.8, 999)
        --
    end

    function obj.onupdate(dt)
        local textheight = font_main:getHeight()

        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        --
        local locstr = ls_ShortGame
        local textwidth = font_main:getWidth(locstr)
        local minx = width/20
        if(touches.isInArea(minx, height*0.1, minx+textwidth, height*0.1+textheight))then
            UI.restart(200)
            Grid.perform(true)
            obj.perform(false)
            touches.pause(0.5)
        end

        --
        locstr = ls_MediumGame
        textwidth = font_main:getWidth(locstr)
        minx = width/20
        if(touches.isInArea(minx, height*0.3, minx+textwidth, height*0.3+textheight))then
            UI.restart(500)
            Grid.perform(true)
            obj.perform(false)
            touches.pause(0.5)
        end

        --
        locstr = ls_LongGame
        textwidth = font_main:getWidth(locstr)
        minx = width/20
        if(touches.isInArea(minx, height*0.5, minx+textwidth, height*0.5+textheight))then
            UI.restart(1000)
            Grid.perform(true)
            obj.perform(false)
            touches.pause(0.5)
        end
        
        --
        locstr = ls_Back
        textwidth = font_main:getWidth(locstr)
        minx = width/20
        if(touches.isInArea(minx, height*0.5, minx+textwidth, height*0.8+textheight))then
            obj.perform(false)
            MainMenu.perform(true)
        end

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