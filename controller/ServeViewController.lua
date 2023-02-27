--[[ 
    ServeViewController class

    Controller intended for ServeView 
 ]]

 ServeViewController = Class{__includes = BaseController}

 function ServeViewController:init(viewDelegate)
    -- set the delegate
    self.d = viewDelegate
 end

 function ServeViewController:update(dt)
    -- routine press esc:
    if love.keyboard.wasPressed('escape') then
        esc_key()
    end

    self.d.paddle:update(dt)
    -- make the ball to follow the paddle:
    -- not really the best practice but let's just access the location variables directly
    self.d.ball.x = self.d.paddle.x + (self.d.paddle.width / 2) - 4
    self.d.ball.y = self.d.paddle.y - 8

    -- when player press enter/return change to play view and pass all the informations.
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        -- pass the params to play view
        gameStates:change('play', {
            paddle = self.d.paddle,
            bricks = self.d.bricks,
            health = self.d.health,
            score = self.d.score,
            ball = self.d.ball,
            level = self.d.level --pass the level to play state
        })
    end
 end