--[[ 
    class OverViewController
    controller for GameOverView class
 ]]

 OverViewController = Class{__includes = BaseController}

 function OverViewController:init(viewDelegate)
    self.d = viewDelegate
 end

 function OverViewController:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        -- change to start
        gameStates:change('start')
    end

    if love.keyboard.wasPressed('escape') then
        esc_key()
    end
 end