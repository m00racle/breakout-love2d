--[[ 
    class GameOverView
    provides the view presented when the game is over
    enter when health = 0
 ]]

 GameOverView = Class{__includes = BaseViewer}

 -- init required the implementation to state to define the viewer and controller!
function GameOverView:init(controller) 
    self.controller = controller(self)
end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function GameOverView:enter(params) self.score = params.score end
function GameOverView:exit() end
function GameOverView:control(dt) self.controller:update(dt) end
function GameOverView:render() 
    love.graphics.setFont(gameFonts['large'])
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gameFonts['medium'])
    love.graphics.printf('Final Score: ' .. tostring(self.score), 0, VIRTUAL_HEIGHT /2, VIRTUAL_WIDTH, 'center')
    -- .. means string concat
    love.graphics.printf('Press Enter!', 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
end