--[[ 
    This is the start game states

    the viewer : StartView
    the controller : StartViewController
 ]]

 StartState = Class{__includes = BaseStateHandler}

 -- init required the implementation to state to define the viewer and controller!
function BaseStateHandler:init(viewer, controller) 
    self.viewer = viewer
    self.contoller = controller
end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function BaseStateHandler:enter() end
function BaseStateHandler:exit() end
function BaseStateHandler:view() 
    -- pass the render to the viewer class
    self.viewer:render()
end
function BaseStateHandler:control(dt) 
    -- pass the control to the controller
    self.contoller:update(dt)
end