--[[ 
    PlayViewController class

    This is the callback and delegate class for the PlayView class

    Just init this and put self as parameter argument
 ]]

 PlayViewController = Class{__includes = BaseController}

function PlayViewController:init(viewDelegate) -- this is initialized in PlayView class' object
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

    -- detect collision for ball to paddle
    if self.d.ball:collides(self.d.paddle) then
        -- handle collison to paddle.
        self.d.ball:inertia_bounce(self.d.paddle)
    end

    -- check each brick:
    for k, brick in pairs(self.d.bricks) do
        -- check collison for inPlay bricks 
        if brick.inPlay and self.d.ball:collides(brick) then
            -- trigger brick hit function:
            brick:hit()
            -- call static collision and pass the current brick
            self.d.ball:static_bounce(brick)
            
            -- only allowing one brick collison here:
            break
        end
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end