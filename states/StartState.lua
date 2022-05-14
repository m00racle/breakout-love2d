--[[ 
    This is the start game states

    the viewer : StartView
    the controller : StartViewController
 ]]

 StartState = Class{__includes = BaseStateHandler}

 -- init required the implementation to state to define the viewer and controller!
function StartState:init(viewer, controller) 
    self.viewer = viewer
    self.contoller = controller
end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function StartState:enter() end
function StartState:exit() end
function StartState:view() 
    -- pass the render to the viewer class
    self.viewer:render()
end
function StartState:control(dt) 
    -- pass the control to the controller
    self.contoller:update(dt)
end