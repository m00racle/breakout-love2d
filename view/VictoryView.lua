--[[  
    VictoryView Class

    Vieer for Victory State

]]

VictoryView = Class{__includes = BaseViewer}

 -- init required the implementation to state to define the viewer and controller!
function VictoryView:init(controller) 
    self.controller = controller(self)
end
 -- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function VictoryView:enter(params) 
    self.level = params.level
    self.score = params.score
    self.paddle = params.paddle
    self.health = params.health
    self.ball = params.ball
end

function VictoryView:exit() end

function VictoryView:control(dt) 
    self.controller:update(dt)
end

function VictoryView:render() 
    self.paddle:render()
    self.ball:render()

    renderHealth(self.health)
    renderScore(self.score)

    -- level complete text
    love.graphics.setFont(gameFonts['large'])
    love.graphics.printf("Level " .. tostring(self.level) .. " complete!", 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')

    -- instruction text
    love.graphics.setFont(gameFonts['medium'])
    love.graphics.printf("Press Enter to serve!", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end