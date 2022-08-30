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
function PlayView:init(controller) 
    self.controller = controller(self)
    -- init the paddle
    self.paddle = Paddle()
    self.ball = Ball(1, VIRTUAL_WIDTH / 2 - 4, VIRTUAL_HEIGHT - 42)
end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function PlayView:enter() end
function PlayView:exit() end

-- controls:
function PlayView:control(dt) 
    self.controller:update(dt)
end
function PlayView:render() 
    self.paddle:render()

    -- render the ball
    self.ball:render()

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