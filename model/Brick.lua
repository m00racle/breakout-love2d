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
    gameSounds['brick-hit-2']:stop()
    -- NOTE: this to make sure if multiple bricks is hit the sound will not overlap
    gameSounds['brick-hit-2']:play()

    -- if tier is > 0 then look at color!:
    -- IF color == 1 (lowest color) then degrade one tier ELSE degrade one color
    -- ELSE (if tier == 0) then IF color == 1 bricks out of play ELSE (color > 1) degrade color
    if self.tier > 0 then 
        if self.color == 1 then
            self.tier = self.tier - 1
            self.color = 5 
            -- NOTE: when tier is degraded then color is back to max which is 5
        else 
            self.color = self.color -1
        end
    else
        if self.color == 1 then
            self.inPlay = false
        else
            self.color = self.color - 1
        end
    end

    -- put different sond when bricks is OUT OF PLAY
    if not self.inPlay then
        gameSounds['brick-hit-1']:stop()
        gameSounds['brick-hit-1']:play()
    end
    -- end of Brick:hit() function
end

function Brick:setColor(color)
    self.color = color
end

function Brick:setTier(tier)
    self.tier = tier
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