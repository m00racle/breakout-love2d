--[[ 
    PlayView class

    Represent the rendered states of the game in which we are actively playing;
    player should control the paddles,
    with ball actively bouncing between the bricks, walls, and the paddle. 
    If the ball goes below the paddle, the the player should lose one point of life
    and taken either to the GameOver screen if life = 0 or the Serve states otherwise.
 ]]

 PlayView = Class{__includes = BaseViewer}

--  local
local paused = false

  -- init required the implementation to state to define the viewer and controller!
function PlayView:init(controller) -- initialize in the loader.lua passing PlayViewController
    -- this initialization by passing PlayViewController also init that but with no argument

    self.controller = controller(self) -- here we pass the argument that viewDelegate is the object of this class
    
end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function PlayView:enter(params)
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score
    self.ball = params.ball
    self.level = params.level
end

function PlayView:exit() end

-- controls:
function PlayView:control(dt) 
    self.controller:update(dt)
end

-- render
function PlayView:render() 
    self.paddle:render()

    -- render the ball
    self.ball:render()

    -- render bricks
    -- only render bricks with inPlay = true
    for k, brick in pairs(self.bricks) do
        brick:render()
        brick:renderParticles()
    end

    renderHealth(self.health)

    renderScore(self.score)

    -- pause text if paused
    if paused then
        love.graphics.setFont(gameFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end
end


-- getter setter
function PlayView:isPaused()
    return paused
end

function PlayView:setPaused(action)
    paused = action
end