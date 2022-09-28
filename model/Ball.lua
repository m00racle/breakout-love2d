--[[
    GD50
    Breakout Remake

    -- Ball Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
    Represents a ball which will bounce back and forth between the sides
    of the world space, the player's paddle, and the bricks laid out above
    the paddle. The ball can have a skin, which is chosen at random, just
    for visual variety.
]]

Ball = Class{}

function Ball:init(skin, x, y)
    -- skin (int) : type of ball skin
    -- x (int) : initial position of x
    -- y (int) : initial position of y
    
    -- CAUTION: this is a bit different to the course code since I want to make encapsulation of this class
    -- I will only allow outside to change variable only through constructors and functions not variables

    -- set the height and width of the ball
    self.height = 8 -- in pixels
    self.width = 8 

    self.x = x
    self.y = y

    -- track movement variables dy and dx
    self.dy = math.random(-200, 200) -- initial movement is zero 
    self.dx =  math.random(-50, -60)
    -- set the skin from parameter skin above.
    self.skin = skin
end

function Ball:collides(target)
    -- this function detect collision 
    -- parameter : target object type which has data y and x (position) such as paddle and tiles

    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check the bottom edge of either higher than the target's top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    -- if none of this true then collision happen:
    return true
end

function Ball:reset() 
    self.x = VIRTUAL_WIDTH/2 - 4
    self.y = VIRTUAL_WIDTH/2 - 4
    self.dx = 0
    self.dy = 0
end

function Ball:update(dt) 
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    -- allow ball to bounce off walls
    if self.x <= 0 then
        self.x = 0
        self.dx = -self.dx -- reverse the direction in x axis
        gameSounds['wall-hit']:play()
    end

    -- allow bounce right wall
    if self.x >= VIRTUAL_WIDTH - 8 then
        self.x = VIRTUAL_WIDTH - 8
        self.dx = - self.dx -- reverse the direction in x axis
        gameSounds['wall-hit']:play()
    end

    -- bounce top wall
    if self.y <= 0 then
        self.y = 0
        self.dy = - self.dy -- reverse the direction in y axis.
        gameSounds['wall-hit']:play()
    end

end

function Ball:inertia_bounce(paddle)
    -- FIX: make sure ball above in case it hits the paddle side:
    self.y = paddle.y - self.height
    -- this handles vertical bounce when hitting paddle or
     self.dy = - self.dy

    --  if the ball hit the left side (region) of the paddle while moving left
    if self.x < paddle.x + (paddle.width / 2) and paddle.dx < 0 then
        self.dx = -50 + -(self.width * (paddle.x + paddle.width / 2 - self.x))

        -- else if we hit the left side paddle while moving right:
    elseif self.x > paddle.x + (paddle.width / 2) and paddle.dx > 0 then
        self.dx = 50 + (self.width * math.abs(paddle.x + paddle.width / 2 - self.x))
    end
    
     gameSounds['paddle-hit']:play()
end

function Ball:render()
    -- gameTexture is our global texture for all blocks
    -- gameBallFrames is a table of quads mapping to each individual ball skin in the texture.
    love.graphics.draw(gameTextures['main'], gameFrames['balls'][self.skin], self.x, self.y)
end
