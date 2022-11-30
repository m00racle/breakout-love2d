--[[ 
    StartViewController

    This is the class that handles controller for StartView
    - update the view
    - handle user inputs
 ]]

StartViewController = Class{__includes = BaseController}

function StartViewController:init(viewDelegate)
    self.delegate = viewDelegate
end

function StartViewController:update(dt)
    -- toggle highlighted option if we press an arrow key up or down
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        -- change the highlight according to the current highlight from view
        changeHighlight = self.delegate:getHighlight() == 1 and 2 or 1
        self.delegate:setHighlight(changeHighlight)
        gameSounds['paddle-hit']:play()
    end

    -- confirm whichever option we have selected to change screen
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gameSounds['confirm']:play()

        if self.delegate:getHighlight() == 1 then
            gameStates:change('serve', {
                paddle = Paddle(),
                bricks = LevelMaker.createMap(1),
                health = maxHealth,
                score = 0
            })
        end
    end

    -- we no longer have this globally, so include here
    if love.keyboard.wasPressed('escape') then
        esc_key()
    end
    -- update the highlight in the view delegate
    
end