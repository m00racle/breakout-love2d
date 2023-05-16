--[[  
    STATE where if the player gets high score here he/she can input it.
]]

EnterScoreView = Class{__includes=BaseViewer}

 -- init required the implementation to state to define the viewer and controller!
function EnterScoreView:init(controller) 
    self.c = controller(self)
end
 -- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function EnterScoreView:enter(params) end
function EnterScoreView:exit() end
function EnterScoreView:control(dt) end
function EnterScoreView:render() end