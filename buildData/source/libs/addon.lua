---------------------------------------------------------------------
--main draw stack
addon = {}
local stack = {}

local canvases = {}

local function prepareCanvas(canvasID)
    canvases[canvasID] = {}
    canvases[canvasID].canvas = love.graphics.newCanvas()
    canvases[canvasID].effect = nil
end

function addon.drawAdd(func,canvasID)
    if(stack[canvasID]==nil)then
        stack[canvasID] = {}
    end

    if(canvases[canvasID]==nil)then
        prepareCanvas(canvasID)
    end

    table.insert(stack[canvasID],func)
    return #stack[canvasID]
end

function addon.drawRemove(key,canvasID)
    table.remove(stack[canvasID],key)
end

function addon.drawIf(previousFlag,key,func,canvasID,performFlag)

    if(performFlag==false)then
        addon.drawRemove(key,canvasID)
        return false, key

    elseif(performFlag==true)then
        if(previousFlag==false)then
            key = addon.drawAdd(func,canvasID)

        end
        return true, key

    end
end

function love.draw(dt)
    local stack = stack
    local g = love.graphics
    local canvases = canvases

    for canvasID, lowerStack in pairs(stack)do
        local c = canvases[canvasID].canvas
        g.setCanvas(c)

        for k, func in pairs(lowerStack)do
            
            func(dt)

        end
        g.setCanvas()

        if(canvases[canvasID].effect)then
            canvases[canvasID].effect(function()
                g.canvasDraw(c)
            end)
        else
            g.canvasDraw(c)
        end

        g.canvasClear(c)
    end
end

function addon.setEffect(effectfunc,canvasID)
    if(canvases[canvasID]==nil)then
        prepareCanvas(canvasID)
    end
    canvases[canvasID].effect = effectfunc
end

function addon.clearEffect(canvasID)
    canvases[canvasID].effect = nil
end

--update stack
local upd = {}

function addon.updateAdd(func)
    table.insert(upd,func)
    --return key
    return #upd
end

function addon.updateRemove(key)
    table.remove(upd,key)
end

function addon.updateIf(previousFlag,key,func,performFlag)

    if(performFlag==false)then
        addon.remove(key)
        return false, key

    elseif(performFlag==true)then
        if(previousFlag==false)then
            key = addon.add(func)

        end
        return true, key

    end
end

function love.update(dt)
    for k,func in pairs(upd) do
        func(dt)
    end
end