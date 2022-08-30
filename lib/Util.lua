--[[
    GD50
    Breakout Remake

    -- StartState Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Helper functions for writing games.
]]

--[[
    Given an "atlas" (a texture with multiple sprites), as well as a
    width and a height for the tiles therein, split the texture into
    all of the quads by simply dividing it evenly.
]]
function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

--[[
    Utility function for slicing tables, a la Python.

    https://stackoverflow.com/questions/24821045/does-lua-have-something-like-pythons-slice
]]
function table.slice(tbl, first, last, step)
    local sliced = {}
  
    for i = first or 1, last or #tbl, step or 1 do
      sliced[#sliced+1] = tbl[i]
    end
  
    return sliced
end

--[[
    This function is specifically made to piece out the paddles from the
    sprite sheet. For this, we have to piece out the paddles a little more
    manually, since they are all different sizes.
]]
function GenerateQuadsPaddles(atlas)
    local x = 0
    local y = 64

    local counter = 1
    local quads = {}

    for i = 0, 3 do
        -- smallest
        quads[counter] = love.graphics.newQuad(x, y, 32, 16,
            atlas:getDimensions())
        counter = counter + 1
        -- medium
        quads[counter] = love.graphics.newQuad(x + 32, y, 64, 16,
            atlas:getDimensions())
        counter = counter + 1
        -- large
        quads[counter] = love.graphics.newQuad(x + 96, y, 96, 16,
            atlas:getDimensions())
        counter = counter + 1
        -- huge
        quads[counter] = love.graphics.newQuad(x, y + 16, 128, 16,
            atlas:getDimensions())
        counter = counter + 1

        -- prepare X and Y for the next set of paddles
        x = 0
        y = y + 32
    end

    return quads
end

--[[ 
    function GenerateQuadsBalls
        Parameters: 
        Atlas : Texture class

        Returns:
        quads : {Quad} table of quads
    
        This cut the atlas to be image Quads which then put into table
 ]]

 function GenerateQuadsBalls(atlas)
    local x = 96 -- after 3 tiles (each 32px)
    local y = 48 -- after 3 tiles (each 16 px high)

    local counter = 1 -- put index counter to Quads inside the table creted below
    local quads = {} -- prepare the table to store all quads of ball types and skins

    -- we want to take small pairs of balls to be each pair Quad (see notepad)
    -- the quads images for ball types are divided into two rows.

    -- getting Quads from row 1 Ball is 8 px height 8 px width

    for i = 0, 3 do
        -- extract the top row ball types
        -- there are 3 types 
        quads[counter] = love.graphics.newQuad(x, y, 8, 8, atlas:getDimensions())
        x = x + 8 -- ball pair width is 8 px
        counter = counter + 1
    end

    -- extract the second (bottom) row of ball pairs 
    x = 96 -- reset the x coordinate to 96
    y = 56 -- initial y coordinate is 48, add by ball height 8 px = 56 px

    for i = 0, 2 do
        -- there are two pairs to be extracted as Quad
        quads[counter] = love.graphics.newQuad(x, y, 8, 8, atlas:getDimensions())
        -- shift to x by 8 px
        x = x + 8
        -- add counter to the next one by 1
        counter = counter + 1
    end

    return quads
end
