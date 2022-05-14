--[[ 
    loader.lua

    is the file which love.load() located
    the main purpose of this part is to load necessary resources and initial settings
 ]]

 function love.load()
    -- set the default filter to 'nearest' thus there will be no filtering of pixels (blurriness)
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- seed the Random Number Generator that calls to random are always "random"
    math.randomseed(os.time())

    -- set the application title bar
    love.window.setTitle('Breakout')

    -- initialize the fonts into a table
    gameFonts = {
        ['small'] = love.graphics.newFont('res/font/font.ttf', 8),
        ['medium'] = love.graphics.newFont('res/font/font.ttf', 16),
        ['large'] = love.graphics.newFont('res/font/font.ttf', 32)
    }
    love.graphics.setFont(gameFonts['small'])

    -- load the graphics we'll be using throughout the game states
    gameTextures = {
        ['background'] = love.graphics.newImage('res/graphics/background.png'),
        ['main'] = love.graphics.newImage('res/graphics/breakout.png'),
        ['arrows'] = love.graphics.newImage('res/graphics/arrows.png'),
        ['hearts'] = love.graphics.newImage('res/graphics/hearts.png'),
        ['particle'] = love.graphics.newImage('res/graphics/particle.png')
    }

    -- set virtual resolution to render within actual windows no matter its dimensions
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOWS_WIDTH, WINDOWS_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    -- loading sound effects
    gameSounds = {
        ['paddle-hit'] = love.audio.newSource('res/sounds/paddle_hit.wav', 'static'),
        ['score'] = love.audio.newSource('res/sounds/score.wav', 'static'),
        ['wall-hit'] = love.audio.newSource('res/sounds/wall_hit.wav', 'static'),
        ['confirm'] = love.audio.newSource('res/sounds/confirm.wav', 'static'),
        ['select'] = love.audio.newSource('res/sounds/select.wav', 'static'),
        ['no-select'] = love.audio.newSource('res/sounds/no-select.wav', 'static'),
        ['brick-hit-1'] = love.audio.newSource('res/sounds/brick-hit-1.wav', 'static'),
        ['brick-hit-2'] = love.audio.newSource('res/sounds/brick-hit-2.wav', 'static'),
        ['hurt'] = love.audio.newSource('res/sounds/hurt.wav', 'static'),
        ['victory'] = love.audio.newSource('res/sounds/victory.wav', 'static'),
        ['recover'] = love.audio.newSource('res/sounds/recover.wav', 'static'),
        ['high-score'] = love.audio.newSource('res/sounds/high_score.wav', 'static'),
        ['pause'] = love.audio.newSource('res/sounds/pause.wav', 'static'),

        ['music'] = love.audio.newSource('res/sounds/music.wav', 'static')
    }

    -- prepare keysPressed table
    -- set it into empty table for now
    -- this will contain the key inputs from the users
    love.keyboard.keysPressed = {}

    -- TODO load the states (waiting for each state to be ready)
    gameStates = StateMachine {
        ['start'] = function() return StartState(StartView, StartViewController) end
    }

    gameStates:change('start')

 end

 -- implement the push protocol
 function love.resize(w,h)
    -- push it to resize
    push:resize(w,h)
 end