--[[ 
    Controller for HighScoreView.lua
 ]]

 HighScoreController = Class{__includes = BaseController}

function HighScoreController:init(viewDelegate) 
    self.d = viewDelegate
end

function HighScoreController:update(dt) end