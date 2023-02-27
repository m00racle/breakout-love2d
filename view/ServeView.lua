--[[ 
    ServeView class

    Represent state where between ball over or after transition from start befor to play states.
 ]]

 ServeView = Class{__includes = BaseViewer}

 function ServeView:init(controller)
    -- delegate the controller:
    self.controller = controller(self)

 end

 function ServeView:enter(params)
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score
    self.level = params.level

    -- init new ball since only two state gets here ball out of play or start
    -- use random skin (rmemeber there are 7 type of skins)
    self.ball = Ball(math.random(7), VIRTUAL_WIDTH / 2 - 4, VIRTUAL_HEIGHT - 42)
 end

 function ServeView:exit() 
    -- nothing to add yet
 end
 
 function ServeView:control(dt) 
    -- pass to controller
    self.controller:update(dt)
 end

 function ServeView:render()
    self.paddle:render()
    self.ball:render()

    -- render bricks
    for k, brick in pairs(self.bricks) do
        brick:render()
    end

    -- render score
    renderScore(self.score)

    -- render health
    renderHealth(self.health)

    -- render the level
    love.graphics.setFont(gameFonts['large'])
    love.graphics.printf('Level ' .. tostring(self.level), 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')

   --  render command 
   love.graphics.setFont(gameFonts['medium'])
   love.graphics.printf('Press Enter to Serve!', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
 end