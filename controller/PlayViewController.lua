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
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.delegate:setPaused(true)
        gameSounds['pause']:play()
        return
    end

    -- update the paddle model instance
    self.delegate.paddle:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end