--[[
    Brick is a class representing Brick object in the game
]]

Brick = Class{}

function Brick:init(x,y)
    -- TODO: put each variables thier initial values. 
    self.x = x
    self.y = y
    -- self.tier = 1
    -- self.color = 1
    -- self.width = int
    -- self.height = int
    self.inPlay = true
end

function Brick:hit()
    -- TODO: what are need to do when the brick is hit by the ball
    -- Play sound
end

function Brick:render()
    -- TODO: what to render
    
end