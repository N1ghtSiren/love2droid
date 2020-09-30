local circle = love.graphics.circle
local touches = {}

function love.update(dt)
    --touches
    for i, id in ipairs(love.touch.getTouches()) do
        table.insert(touches,{love.touch.getPosition(id)})
    end
    --mouse
    if(love.mouse.isDown(1))then
		table.insert(touches,{love.mouse.getPosition()})
	end
end

function love.draw()
    for k,v in pairs(touches) do
        circle("fill",v[1], v[2], 30)
        table.remove(touches,k)
    end
end