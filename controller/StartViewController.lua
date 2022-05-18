--[[ 
    StartViewController

    This is the class that handles controller for StartView
    - update the view
    - handle user inputs
 ]]

StartViewController = Class{__includes = BaseController}

function StartViewController:update(dt, viewParams)
    -- toggle highlighted option if we press an arrow key up or down
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = viewParams['highlighted']
        highlighted = highlighted == 1 and 2 or 1
        gameSounds['paddle-hit']:play()
        -- update the viewParams
        viewParams['highlighted'] = highlighted
    end

    -- we no longer have this globally, so include here
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    return viewParams
end