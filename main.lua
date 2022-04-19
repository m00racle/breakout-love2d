--[[ CS 50 GAMING BREAKOUT

    This is the main.lua which will be searched first by the compiler once the Love2D is run. 

    In this source code most likely will only consist of includes syntax referring to other file locations. 

    This in order to create programming paradigm inline wiht MVC sofware design pattern.
 ]]

-- dependencies:

push = require 'lib/push' // https://github.com/Ulydev/push
--[[ push 
    push is a library that will allow us to draw our game at a virtual resolution, 
    instead of however large our window is;
    used to provide more retro aesthetic
 ]]
Class = require 'lib/class' // https://github.com/vrld/hump/blob/master/class.lua
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

--require Base state