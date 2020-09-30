touches = {}
touches.paused_time = 0
touches.isPaused = false
local t = {}


function touches.add(x,y)
    if(touches.isPaused)then return end

	if(x<w and x>0 and y>0 and y<h)then
        table.insert(t,{x,y})
    end

end

function touches.clear(time)
    for k,_ in pairs(t)do
        t[k] = nil
    end

end

function touches.get()
	return t
end

function touches.isInArea(minx,miny,maxx,maxy)
    local points = touches.get()
    local x, y = nil

    for _, t in ipairs(points) do
        x, y = unpack(t)
        if(x<maxx and x>minx and y>miny and y<maxy)then
            return true
        end
    end
    return false
end

function touches.pause(time)
    touches.isPaused = true
	touches.paused_time = time
end

function touches.update(dt)
    if(touches.isPaused)then
        touches.paused_time = touches.paused_time - dt
    end
	if(touches.paused_time<=0)then
		touches.isPaused = false
	end
end

--main function
function love.run()
	if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
 
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end
 
	local dt = 0
 
	-- Main loop time.
	return function()
		-- Process events.
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end
        
        --get touches
        local t = love.touch.getTouches()

        for i, id in ipairs(t) do
            local x,y = love.touch.getPosition(id)
            touches.add(x,y)
        end

		--debug - get mouse
		if(love.mouse.isDown(1))then
        	x,y = love.mouse.getPosition()
			touches.add(x,y)
		end
 
		-- Update dt, as we'll be passing it to update
		if love.timer then dt = love.timer.step() end

        --anti-spike
        if(dt>0.03125)then
            dt = 0
		end
        touches.update(dt)
        
		-- Call update and draw
		if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
 
		if love.graphics and love.graphics.isActive() then
			love.graphics.origin()
			love.graphics.clear(love.graphics.getBackgroundColor())
 
			if love.draw then love.draw(dt) end
 
			love.graphics.present()
		end

		if love.timer then love.timer.sleep(0.001) end
	end
end