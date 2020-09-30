----globals
--w = love.graphics.getWidth()
--h = love.graphics.getHeight()
--circle = love.graphics.circle
--
--font_size_small = math.floor((love.graphics.getHeight()/20)+1)
--font_small = love.graphics.newFont("fonts/comicsans.ttf", font_size_small)
--
--font_size_big = math.floor((love.graphics.getHeight()/10)+1)
--font_big = love.graphics.newFont("fonts/umeboshi.ttf", font_size_big)
--
--font_size_main = math.floor((love.graphics.getHeight()/15)+1)
--font_main = love.graphics.newFont("fonts/umeboshi.ttf", font_size_main)
--
--rgba = {}
--rgba[1] = {1, 1, 1, 0.7} 
--rgba[2] = {1, 0.28, 0.10, 0.7}
--rgba[3] = {0, 0.6, 0, 0.7}
--rgba[4] = {0, 0.36, 90, 0.7}
--
--brgba = {}
--brgba[1] = {0, 0, 0, 1}
--brgba[2] = {0, 0, 0, 1}
--brgba[3] = {0, 0, 0, 1}
--brgba[4] = {0, 0, 0, 1}
----endglobals
--
--
--require("libs/touches")
--require("libs/addon")
--require("libs/TRASH")
--
--local function f()
--    local t = touches.get()
--
--    for k,_ in pairs(t) do
--        circle("fill",t[k][1],t[k][2],30)
--    end
--
--    touches.clear()
--end
--addon.drawAdd(f,1)

local width = love.graphics.getWidth
local printf = love.graphics.printf
local setColor = love.graphics.setColor
local circle = love.graphics.circle
local touches = {}
local touches2 = {}

love.graphics.setFont(love.graphics.newFont("comicsans.ttf", 15))

function love.update(dt)
    --touches
    for i, id in ipairs(love.touch.getTouches()) do
        table.insert(touches,{love.touch.getPosition(id)})
    end
end

function love.draw()
    --green - with love.update
    local i1 = 1
    local i2 = 1

    setColor(0,1,0,1)
    for k,v in pairs(touches) do
        printf(i1.." x: "..v[1]..", y: "..v[2],10,20*i,999)
        circle("fill",v[1], v[2], 30)
        table.remove(touches,k)
        i1 = i1 + 1
    end

    setColor(1,0,0,1)
    for k,v in pairs(touches2) do
        printf(i2.." x: "..v[1]..", y: "..v[2],width()/2+10,20*i,999)
        circle("fill",v[1], v[2], 20)
        i2 = i2 + 1
    end
end

function love.touchpressed( id, x, y, dx, dy, pressure )
    touches2[id] = {x,y}
end

function love.touchreleased( id, x, y, dx, dy, pressure )
    touches2[id] = nil
end