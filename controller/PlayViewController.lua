--[[ 
    PlayViewController class

    This is the callback and delegate class for the PlayView class

    Just init this and put self as parameter argument
 ]]

 PlayViewController = Class{__includes = BaseController}

function PlayViewController:init(viewDelegate) 
    self.d = viewDelegate -- d for delegate
end

function PlayViewController:update(dt) 
    if self.d:isPaused() then
        if love.keyboard.wasPressed('space') then
            self.d:setPaused(false)
            gameSounds['pause']:play()
        else
            -- this will give the ability to quit even in paused condition:
            if love.keyboard.wasPressed('escape') then
                love.event.quit()
            end
            -- this is what makes in paused state we can't move the paddle:
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.d:setPaused(true)
        gameSounds['pause']:play()
        -- this though will just put the state out from paused thus it still detect esc quit key
        -- thus adding if love.keyboard.wasPressed('escape') here is not necessary
        return
    end

    -- update the paddle model instance
    self.d.paddle:update(dt)

    -- update the ball model
    self.d.ball:update(dt)

    -- detect collision
    if self.d.ball:collides(self.d.paddle) then
        -- handle collison to paddle.
        self.d.ball:paddle_bounce()
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end