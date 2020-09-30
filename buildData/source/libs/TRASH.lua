function love.graphics.canvasClear(canvas)
    local g = love.graphics
    g.setCanvas(canvas)
    g.clear()
    g.setCanvas()
end

function love.graphics.canvasDraw(canvas)
    local g = love.graphics
    g.setColor(1, 1, 1, 1)
    g.setBlendMode("alpha", "premultiplied")
    g.draw(canvas)
end

function PolarProjectionXY(x, y, dist, angle)
    local PPx = x + dist * math.cos(angle * 3.14159/180.0)
    local PPy = y + dist * math.sin(angle * 3.14159/180.0)
    return PPx, PPy
end

function percent(num1,num2)
    return num2/num1
end