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

function loadHighScores()
    -- set identity for the Love2D filesystem to 'breakout'
    love.filesystem.setIdentity("breakout")

    -- check if the file 'breakout.lst' exists, if not, initialize it with default scores
    if not love.filesystem.getInfo('breakout.lst') then
        local scores = ''
        for i = 10, 1, -1 do
            scores = scores .. 'CTO\n' -- note .. means concatenation
            scores = scores .. tostring(i * 1000) .. '\n'
            -- this will type scores from 10000 to 1000 descending
        end
        love.filesystem.write('breakout.lst', scores)
    end

    -- Flag for whether we're reading a name or not
    local name = true
    local currentName = nil
    local counter = 1

    -- init scores table with at least 10 blank entries
    local scores = {}
    for i = 1, 10 do
        -- each entry is a table with 'name' and 'score' fields
        scores[i] = {
            name = nil, 
            score = nil
        }
    end

    -- iterate over each line in the file, filling in names and scores
    for line in love.filesystem.lines('breakout.lst') do
        if name then 
            scores[counter].name = string.sub(line, 1, 3)
        else
            scores[counter].score = tonumber(line)
            counter = counter +1
        end
        -- flip the name flag to ensure score inserted for each name inserted
        name = not name
    end
    -- return the loadad scores table
    return scores
end

function displayFPS() 
    -- display FPS count in the screen
    -- just comment out the call if you want to disable this 
    -- FOR DEBUGGING PURPOSES
    love.graphics.setFont(gameFonts['small'])
    love.graphics.setColor(0,1,0,1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end

function renderHealth(health)
    -- render heart based on the value of the health
    local healthX = VIRTUAL_WIDTH - 100

    -- render health left:
    for i=1, health do
        -- render light colored heart
        love.graphics.draw(gameTextures['hearts'], gameFrames['hearts'][1], healthX, 4)
        -- shift the healthX for the next heart: give it heart widht plus 1 pixel
        healthX = healthX + 11 
    end

    for i=1, maxHealth - health do
        -- render black colored heart
        love.graphics.draw(gameTextures['hearts'], gameFrames['hearts'][2], healthX, 4)
        -- shift the healthX for the next heart:
        healthX = healthX + 11 
    end
end

function renderScore(score)
    love.graphics.setFont(gameFonts['small'])
    love.graphics.print('Score: ', VIRTUAL_WIDTH - 60, 5)
    love.graphics.printf(tostring(score), VIRTUAL_WIDTH - 50, 5, 40, 'right')
end