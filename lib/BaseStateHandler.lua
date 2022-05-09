--[[ 
    Base state handler is the parent class (super class) for other statesHandler.
    However this will also delegate the implementation only on initializing the state
    starting the state and exiting the state

    NOTE: I want to implement MVC design structure thus I need to define the viewer and controller each time a state is called
 ]]

-- declaring the class
BaseStateHandler = Class{}

function BaseStateHandler:init() end
function BaseStateHandler:enter() end
function BaseStateHandler:exit() end
