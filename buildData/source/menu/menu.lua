menu_main = {}

function menu_main.create(groupID)
    local obj = object.create(groupID)
    
    function obj.ondraw()
        local height = love.graphics.getHeight()
        local width = love.graphics.getWidth()
        local printf = love.graphics.printf
        
        --title
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(font_big)
        local locstr = ls_Bubbles
        local textwidth = font_main:getWidth(locstr)
        printf(locstr, width/2-textwidth/1.4, height*0.05, 999)

        --
        love.graphics.setFont(font_main)
        locstr = ls_Start_Game
        textwidth = font_main:getWidth(locstr)
        printf(locstr, width/2-textwidth/2, height*0.3, 999)

        --
        locstr = ls_Options
        textwidth = font_main:getWidth(locstr)
        printf(locstr, width/2-textwidth/2, height*0.45, 999)

        --
        locstr = ls_ThanksTo
        textwidth = font_main:getWidth(locstr)
        printf(locstr, width/2-textwidth/2, height*0.6, 999)
=======
        printf(locstr, width/2-textwidth/2, height*0.5, 999)
>>>>>>> parent of a618bb8... 1.1.1 [test]

        --
        locstr = ls_Exit
        textwidth = font_main:getWidth(locstr)
        printf(locstr, width/2-textwidth/2, height*0.7, 999)
    end

    function obj.onupdate(dt)

        local textheight = font_main:getHeight()

        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        
        local locstr = ls_Start_Game
        local textwidth = font_main:getWidth(locstr)
        local minx = width/2-textwidth/2
        --
        if(touches.isInArea(minx, height*0.3, minx+textwidth, height*0.3+textheight))then
            StartMenu.perform(true)
            obj.perform(false)

            touches.pause(1)
        end

        locstr = ls_Options
        textwidth = font_main:getWidth(locstr)
        minx = width/2-textwidth/2
        
        if(touches.isInArea(minx, height*0.5, minx+textwidth, height*0.5+textheight))then
            OptionsMenu.perform(true)
            obj.perform(false)

            touches.pause(0.5)
        end

<<<<<<< HEAD
        --
        locstr = ls_ThanksTo
        textwidth = font_main:getWidth(locstr)
        minx = width/2-textwidth/2
        
        if(touches.isInArea(minx, height*0.6, minx+textwidth, height*0.6+textheight))then
            ThanksTo.perform(true)
            obj.perform(false)
        
            touches.pause(0.5)
        end

        --
        locstr = ls_Exit
=======
        locstr = getLocalizedString("Exit")
>>>>>>> parent of a618bb8... 1.1.1 [test]
        textwidth = font_main:getWidth(locstr)
        minx = width/2-textwidth/2
        
        if(touches.isInArea(minx, height*0.7, minx+textwidth, height*0.7+textheight))then
            love.event.quit()
        end

        touches.clear()
    end

    function obj.oncreate()
        BG = bg.create(groupID-1)
        BG.perform(true)
    end

    function obj.ondestroy()
        
    end
    
    return obj
end