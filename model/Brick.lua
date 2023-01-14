--[[
    Brick is a class representing Brick object in the game
    When brick is hit the ball should bounce with determined angle depending on which part of the brick is hit
    Then it should play sound.
    Then it should drop tier or goes outplay when tier is already 0
]]

Brick = Class{}
-- let's try make the pallete color table to be local
local palleteColors = {
    -- blue color brick
    [1] = {
        ['r'] = 99,
        ['g'] = 155,
        ['b'] = 255
    },
    -- green color brick
    [2] = {
        ['r'] = 106,
        ['g'] = 190,
        ['b'] = 47
    },
    -- red color brick
    [3] = {
        ['r'] = 217,
        ['g'] = 87,
        ['b'] = 99
    },
    -- purple color brick
    [4] = {
        ['r'] = 215,
        ['g'] = 123,
        ['b'] = 186
    },
    -- gold color brick
    [5] = {
        ['r'] = 251,
        ['g'] = 242,
        ['b'] = 54
    }
}

function Brick:init(x,y)
    -- : put each variables thier initial values. 
    self.x = x
    self.y = y
    -- self.tier = 0 -- only used for testing purposes only
    -- self.color = 4 -- only used for testing purposes only
    self.width = 32
    self.height = 16
    self.inPlay = true

    -- setup particle attached to each Bricks thus must be init for each brick
    -- init particle system object
    self.psystem = love.graphics.newParticleSystem(gameTextures['particle'], 64)
    -- see CS-50 GAMING_230114_081141 for more elaborate explanation

    -- set how long the particle should visible when animated (0.5 to 1 seconds)
    self.psystem:setParticleLifetime(0.5, 1)

    -- give acceleration left and right evenly but the acceleration only goes down no particle should move up
    self.psystem:setLinearAcceleration(-15, 0, 15, 80)

    -- set the probability distribution on where the particle should render
    self.psystem:setEmissionArea('normal', 10, 10)
end

function Brick:hit()
    -- : what are need to do when the brick is hit by the ball
    -- set the color of the particle to be the same as the brick hit by the ball
    self.psystem:setColors(
        -- primary 1st color
        palleteColors[self.color].r / 255,
        palleteColors[self.color].g / 255,
        palleteColors[self.color].b / 255,
        -- tier will only affect the opacity of the particle
        55 * (self.tier + 1) / 255,
        -- secondary colors but later in opacity to be 0
        palleteColors[self.color].r / 255,
        palleteColors[self.color].g / 255,
        palleteColors[self.color].b / 255,
        0
    )
    -- set the animation of the particle to be emision
    self.psystem:emit(64)

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

-- add function Brick:update called from PlayViewController:update for each brick to update the animation of particle
function Brick:update(dt)
    self.psystem:update(dt)
end

-- make additional function for brick to animate and reder particles
function Brick:renderParticles()
   love.graphics.draw(self.psystem, self.x + 16, self.y + 8) 
end