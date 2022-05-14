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

function StateMachine:change(stateName, enterParams)
	assert(self.states[stateName]) -- state must exist!
	self.current:exit()
	self.current = self.states[stateName]()
	self.current:enter(enterParams)
end

function StateMachine:control(dt)
    self.current:control(dt)
end

function StateMachine:view()
    self.current:view()
end
