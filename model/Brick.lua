--[[
    Brick is a class representing Brick object in the game
    When brick is hit the ball should bounce with determined angle depending on which part of the brick is hit
    Then it should play sound.
    Then it should drop tier or goes outplay when tier is already 0
]]

Brick = Class{}

function Brick:init(x,y)
    -- : put each variables thier initial values. 
    self.x = x
    self.y = y
    self.tier = 0
    self.color = 4
    self.width = 32
    self.height = 16
    self.inPlay = true
end

function Brick:hit()
    -- : what are need to do when the brick is hit by the ball
    -- Play sound
    gameSounds['brick-hit-2']:play()

    -- TEST: put the brick out of play
    self.inPlay = false
end

function Brick:render()
    -- TODO: what to render
    -- if brick is still inPlay then 
    if self.inPlay then
        -- render the brick quad that is taken from ... gameFrames
        -- TODO: PUT THE quads for all brick types into gameFrames
        love.graphics.draw(gameTextures['main'], gameFrames['bricks'][1 + ((self.color - 1)*4) + self.tier], self.x, self.y)
    end
end