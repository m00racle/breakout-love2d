--[[  
    RECORD THE HIGH SCORE OF THE GAME
]]

HighScoreView = Class{__includes = BaseViewer}

 -- init required the implementation to state to define the viewer and controller!
function HighScoreView:init(controller) 
    self.c = controller(self)
end
 -- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function HighScoreView:enter(params) end
function HighScoreView:exit() end
function HighScoreView:control(dt) end
function HighScoreView:render() 
    love.graphics.setFont(gameFonts['large'])
    love.graphics.printf('High Scores', 0, 20, VIRTUAL_WIDTH, 'center')
    
end