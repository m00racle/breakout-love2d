--[[ 
    PlayViewController class

    This is the callback and delegate class for the PlayView class

    Just init this and put self as parameter argument
 ]]

 PlayViewController = Class{__includes = BaseController}

function PlayViewController:init(viewDelegate) 
    self.delegate = viewDelegate
end

function PlayViewController:update(dt) 
    if self.delegate:isPaused() then
        if love.keyboard.wasPressed('space') then
            self.delegate:setPaused(false)
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
        self.delegate:setPaused(true)
        gameSounds['pause']:play()
        -- this though will just put the state out from paused thus it still detect esc quit key
        -- thus adding if love.keyboard.wasPressed('escape') here is not necessary
        return
    end

    -- update the paddle model instance
    self.delegate.paddle:update(dt)

    -- update the ball model
    self.delegate.ball:update(dt)

    -- detect collision
    if self.delegate.ball:collides(self.delegate.paddle) then
        -- handle collison to paddle.
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end