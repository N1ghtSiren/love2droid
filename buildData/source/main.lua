--globals
w = love.graphics.getWidth()
h = love.graphics.getHeight()
circle = love.graphics.circle

font_size_small = math.floor((love.graphics.getHeight()/20)+1)
font_small = love.graphics.newFont("fonts/comicsans.ttf", font_size_small)

font_size_big = math.floor((love.graphics.getHeight()/10)+1)
font_big = love.graphics.newFont("fonts/umeboshi.ttf", font_size_big)

font_size_main = math.floor((love.graphics.getHeight()/15)+1)
font_main = love.graphics.newFont("fonts/umeboshi.ttf", font_size_main)

rgba = {}
rgba[1] = {1, 1, 1, 0.7} 
rgba[2] = {1, 0.28, 0.10, 0.7}
rgba[3] = {0, 0.6, 0, 0.7}
rgba[4] = {0, 0.36, 90, 0.7}

brgba = {}
brgba[1] = {0, 0, 0, 1}
brgba[2] = {0, 0, 0, 1}
brgba[3] = {0, 0, 0, 1}
brgba[4] = {0, 0, 0, 1}
--endglobals


require("libs/touches")
require("libs/addon")
require("libs/TRASH")

local function f()
    local t = touches.get()

    for k,_ in pairs(t) do
        circle("fill",t[k][1],t[k][2],30)
    end

    touches.clear()
end
addon.drawAdd(f,1)