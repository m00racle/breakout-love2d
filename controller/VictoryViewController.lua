--[[  
    VictoryViewController

    Controller class for VictoryView view class
]]

VictoryViewController = Class{__includes = BaseController}

function VictoryViewController:init(viewDelegate) 
    self.d = viewDelegate
end

function VictoryViewController:update(dt) 
    
    self.d.paddle:update(dt)
    -- have the ball track the paddle
    self.d.ball.x = self.d.paddle.x + (self.d.paddle.width / 2) - 4
    self.d.ball.y = self.d.paddle.y - 8
    -- NOTE: the y axis smaller means higher in the screen 

    -- go to play screen if user press enter
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gameStates:change('serve', {
            level = self.d.level + 1, -- incemented by one level
            bricks = LevelMaker.createMap(self.d.level + 1), -- create bricks one level higher
            paddle = self.d.paddle,
            health = self.d.health,
            score = self.d.score
        })
    end
end