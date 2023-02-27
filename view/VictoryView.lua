--[[  
    VictoryView Class

    Vieer for Victory State

]]

VictoryView = Class{__includes = BaseViewer}

 -- init required the implementation to state to define the viewer and controller!
 function VictoryView:init(controller) end
 -- the viewer and controller argument must be a class in the category and assigned to self.viewer and self.controller
 function VictoryView:enter(params) end
 function VictoryView:exit() end
 function VictoryView:control(dt) end
 function VictoryView:render() end