--[[ 
    UIViewer is the file contains the functions useful to present the UI

    love.draw()

    displayFPS()
 ]]

function love.draw()
    -- push the virtual resolution start
    push:apply('start')

    -- background will always be drawn regardless the state of the application
    local backgroundwidth = gameTextures['background']:getWidth()
    local backgroundHeight = gameTextures['background']:getHeight()

    love.graphics.draw(gameTextures['background'],
        -- draw start coordinate 0,0
        0, 0,
        -- no rotation
        0,
        -- scale factors on X and Y axis so it fills the screen
        VIRTUAL_WIDTH/(backgroundwidth - 1), VIRTUAL_HEIGHT/(backgroundHeight - 1))
    
    --  use the state machine to defer rendering to the current state 
    gameStates:render()

    --  display FPS for debugging -> comment out to reove later on
    displayFPS()

    push:apply('end')
end

function displayFPS() 
    -- display FPS count in the screen
    -- just comment out the call if you want to disable this 
    -- FOR DEBUGGING PURPOSES
    love.graphics.setFont(gameFonts['small'])
    love.graphics.setColor(0,1,0,1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end