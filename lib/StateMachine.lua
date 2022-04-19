--[[ State Machine
    This file is the class of the state machine processor

    The function is to handle state machine enter, render, updates, and exit

    The control will be included in updates 
]]

StateMachine = Class{}

function StateMachine:init(states)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }

    --  set current state to empty first
    self.states = states or {} -- [name] -> [function that returns states]
    self.current = self.empty
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end
