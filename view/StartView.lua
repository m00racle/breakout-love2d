--[[ 
    StartView is a class of the start state views

    This is where we will handle the start states rendered images
 ]]

 StartView = Class{__includes = BaseViewer}

 -- I need to highlight the high score in this state
 -- thus, I will make status in which it is highlighted 
 local highlighted = 1

 function StartView:init(controller)
    self.controller = controller(self)
    
 end

 function StartView:enter() end

 function StartView:exit() end

 function StartView:control(dt)
    self.controller:update(dt)
    
 end

 function StartView:render()
    -- title
    love.graphics.setFont(gameFonts['large'])
    love.graphics.printf("BREAKOUT", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')
    
    -- instructions
    love.graphics.setFont(gameFonts['medium'])

    -- if we're highlighting 1, render that option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 70,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("HIGH SCORES", 0, VIRTUAL_HEIGHT / 2 + 90,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)
    
 end

--  getter and setter of local variable(s)
function StartView:getHighlight()
    return highlighted
end

function StartView:setHighlight(highlighting)
    highlighted = highlighting
end