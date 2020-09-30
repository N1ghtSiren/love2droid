object = {}
local objlist = {}

function object.create()
    local obj = {}
    table.insert(objlist,obj)
	obj.key = #objlist
    obj.performflag = true

    obj.draw = {}

    obj.update = {}

    local function updater(dt)
        if(not obj.performflag)then
            return
        end

        for k,v in pairs(obj.update)do
            v.prevFlag,v.key = addon.updateIf(v.prevFlag,v.key,v.func,v.performflag)
        end

        for k,v in pairs(obj.draw)do
            v.prevFlag,v.key = addon.drawIf(v.prevFlag,v.key,v.func,v.canvasID,v.performflag)
        end
    end
    
    obj.updaterkey = addon.updateAdd(updater)

    obj.registerDraw = object.registerDraw
    obj.registerUpdate = object.registerUpdate

    obj.changeLayer = object.changeLayer
    obj.perform = object.perform
    obj.destroy = object.destroy
    
    return obj
end

function object.registerDraw(self,func,canvasID,isPerform)
    local n = #self.draw+1
    self.draw[n] = {}
    self.draw[n].func = func
    self.draw[n].canvasID = canvasID
    self.draw[n].performflag = isPerform
    self.draw[n].key = nil
    self.draw[n].prevFlag = false
    return n
end

function object.registerUpdate(self,func,isPerform)
    local n = #self.update+1
    self.update[n] = {}
    self.update[n].func = func
    self.update[n].canvasID = canvasID
    self.update[n].performflag = isPerform
    self.update[n].key = nil
    self.update[n].prevFlag = false
    return n
end

function object.drawChangeLayer(self,key,canvasID)
    self.draw[key].canvasID = canvasIDs
end

function object.drawFuncPerform(self,key,performflag)
    self.draw[key].performflag = performflag
end

function object.updateFuncPerform(self,key,performflag)
    self.update[key].performflag = performflag
end

function object.perform(self,flag)
    self.performflag = flag
end

function object.drawClear(self)
    for k, v in pairs(self.draw) do
        addon.drawRemove(v.key,v.canvasID)
    end
    self.draw = nil
end

function object.updateClear(self)
    for k, v in pairs(self.update) do
        addon.updateRemove(v.key)
    end
    self.update = nil
end

function object.destroy(self)
    if(obj.ondestroy)then obj.ondestroy() end
	objlist[obj.key] = nil
	obj = nil
end