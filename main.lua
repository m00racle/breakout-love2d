--[[ CS 50 GAMING BREAKOUT

    This is the main.lua which will be searched first by the compiler once the Love2D is run. 

    In this source code most likely will only consist of includes syntax referring to other file locations. 

    This in order to create programming paradigm inline wiht MVC sofware design pattern.
 ]]

-- GLOBAL CONSTANTS
WINDOWS_WIDTH = 1200
WINDOWS_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- dependencies:

push = require 'lib/push' -- https://github.com/Ulydev/push
--[[ push 
    push is a library that will allow us to draw our game at a virtual resolution, 
    instead of however large our window is;
    used to provide more retro aesthetic
 ]]
Class = require 'lib/class' -- https://github.com/vrld/hump/blob/master/class.lua
--[[ Class
    Class library will allow us to represent anythin in our game as code,
    rather tah keeping track of many disparate variable and methods.
 ]]

require 'lib/StateMachine' 
--[[ StateMachine 
    basic StateMachine list and processor 
    which handles to transition to and from game states smoothly 
    and avoid monolithic code in one file.
 ]]

 require 'lib/BaseStateHandler'
 --[[ 
     StateHandler superclass needed to handle each state transition from the beginning to the exit of each state.
  ]]

  -- put the BaseViewer and BaseController interfaces:
require 'lib/BaseViewer'
require 'view/UIViewer'
require 'view/StartView'

require 'lib/BaseController'
require 'controller/UIController'
require 'controller/StartViewController'

--states
require 'states/StartState'

-- put the loader into the the main
require 'lib/loader'
