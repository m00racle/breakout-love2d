--[[ 
    PlayView

    This class will handle the state transitions and viewer for Play states

    The state where the user start to play the game
    - game rule starts to apply
    - game scoring tracked
    - game objects rendered
    - user takes control of the movements
 ]]

 PlayView = Class{__includes = BaseViewer}

 function PlayView:init(controller)
    self.controller = controller
    -- TODO set class instance of paddle
 end

function PlayView:enter() end
function PlayView:exit() end
function PlayView:control(dt) 
    -- TODO self.controller:update(dt) -> pass the dt to update function on self.controller
end
function PlayView:render() 
    -- TODO render the paddlle

    -- TODO test if state is self.pause ?? <-- find a way to put status as pause or not!
    -- TODO if yes then display theN display the word PAUSE in the screen.
end