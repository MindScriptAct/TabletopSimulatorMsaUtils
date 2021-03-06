require("msa/Core")


local AnimAction = require("msa/Animating/AnimAction")

local Animation = {}
Animation.__index = Animation
setmetatable(Animation, {__call = function (cls, ...) return cls.New(...) end })


--##################################################################
--       constructor
--##################################################################

function Animation.New(params)
    local self = setmetatable({}, Animation)
    -- constructor
    self.animationArray = {};
    self.stepCount = 0;
    self.currentStep = 0;

    return self
end

--##################################################################
--       special functions
--##################################################################

--- Wait for all previous animations to finish
function Animation:Await(onCompleteFunc)
    print("TODO : Animation:Await")
    return self
end

--- Delay current animation
function Animation:Delay(seconds)
    print("TODO : Animation:Delay")
    return self
end

--- function to execute then all previous commands are finished. (function gets array of animated objects as parameter.)
function Animation:Execute(onCompleteFunc)
    print("TODO : Animation:Execute")
    return self
end

--##################################################################
--       Functions to prepare items for chaining
--##################################################################

--- Take one or many Items (for chaining)
function Animation:Take(...)
    print("TODO : Animation:Take")
    return self
end

--- Take items from container (for chaining)
function Animation:TakeFrom(container, amount)
    print("TODO : Animation:TakeFrom")
    return self
end

--- Clone one or many Items (for chaining)
function Animation:Clone(target, amount)
    --print("TODO : Animation:Clone")
    --PrintObject(target, "clone")
    if type(target) == "string" then target = getObjectFromGUID(target) end
    if target == nil then PrintError("Animation:Clone parameter target can't be nil.") return self end
    amount = amount or 1
    for i = 1, amount do
        self.stepCount = self.stepCount + 1
        self.animationArray[self.stepCount] = {
            action = AnimAction.Clone,
            target = target,
            amount = amount,
            targetInteractable = target.interactable
        }
    end
    target.interactable = false;
    return self
end


--##################################################################
--       Single action chaining functions
--##################################################################

--- Move items To new position
function Animation:Move(position)
    --print("TODO : Animation:Move")
    if type(position) ~= "table" then PrintError("Animation:Move position must be table."); return self; end

    local x = position["x"] or position[1]
    local y = position["y"] or position[2]
    local z = position["z"] or position[3]

    if type(x) ~= "number" then PrintError("Animation:Move position must have x number in table."); return self; end
    if type(y) ~= "number" then PrintError("Animation:Move position must have y number in table."); return self; end
    if type(z) ~= "number" then PrintError("Animation:Move position must have z number in table."); return self; end

    self.stepCount = self.stepCount + 1
    self.animationArray[self.stepCount] = {
        action = AnimAction.Move,
        target = {x, y, z}
    }
    return self
end

--- Move items To object
function Animation:MoveTo(target)
    --print("TODO : Animation:MoveTo target : "..type(target))
    if type(target) == "string" then
        target = GetObject(target)
    end
    if type(target) ~= "userdata" then PrintError("Animation:MoveTo target must be valid object."); return self; end
    self.stepCount = self.stepCount + 1
    self.animationArray[self.stepCount] = {
        action = AnimAction.MoveTo,
        target = target,
        targetInteractable = target.interactable
    }
    target.interactable = false;
    return self
end

--- Rotate item/items To new rotation
function Animation:Rotate(x, y, z)
    print("TODO : Animation:Rotate")
    return self
end

--- Scale item/items To new scale
function Animation:Scale(scale)
    print("TODO : Animation:Scale")
    return self
end


--- Transform item/items To new position AND rotation AND scale
function Animation:Transform(position, rotation, scale)
    print("TODO : Animation:Transform")
    return self
end

--- Teleport item/items instantly To new position AND rotation AND scale
function Animation:Teleport(position, rotation, scale)
    print("TODO : Animation:Teleport")
    return self
end

--- Flip item/items
function Animation:Flip()
    print("TODO : Animation:Flip")
    return self
end

--- Sort item/items using custom sort function
function Animation:Sort(sortFunc)
    print("TODO : Animation:Sort")
    return self
end

--- Shuffle items in container
function Animation:Shuffle()
    print("TODO : Animation:Shuffle")
    return self
end

--- Lock item/items
function Animation:Lock()
    print("TODO : Animation:Lock")
    return self
end

--- Unlock item/items
function Animation:Unlock()
    print("TODO : Animation:Unlock")
    return self
end

--- Delete item/items
function Animation:Delete()
    print("TODO : Animation:Delete")
    return self
end

--- Draw to player
function Animation:Draw(player, amount)
    print("TODO : Animation:Draw")
    return self
end

--- Deal to all players
function Animation:Deal(amount)
    print("TODO : Animation:Deal")
    return self
end

--##################################################################
--       Inner works
--##################################################################

--- Move items To new position
function Animation:GetObjectCount()
    return self.stepCount;
end

return Animation
