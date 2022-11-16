--[[ 
    Base viewer will handle what is rendered into the the screen

    the implementation of this class must be put as first argument to the BaseStateHandler implementation class
 ]]

 BaseViewer = Class{}

 -- init required the implementation to state to define the viewer and controller!
function BaseViewer:init(controller) end
-- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
function BaseViewer:enter(params) end
function BaseViewer:exit() end
function BaseViewer:control(dt) end
function BaseViewer:render() end
