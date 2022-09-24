--[[ 

-- LevelMaker Class

Creates randomized levels for Breakout Game.

Returns table of BRICK type objects. 

This will decide the difficulties levels of the brick structure.
 ]]

 LevelMaker = Class{}

 --[[ 
    Creates a table of Brick type objects to be returned into main game,
    with differenct possible ways of rancomizing rows and columns of bricks.
    
    Calculates the brick colors and tiers to choose based on the level passed in.
  ]]

  function LevelMaker.createMap(level)
    local bricks = {}

    -- random choode the number of rows between 1 to 5
    -- local numRows = math.random(1,5)
    -- TEST: numRow constant
    local numRows = 2

    -- randomly choose number of columns (from 7 to 13)
    -- local numCols = math.random(7, 13)
    -- TEST: numCol constant
    local numCols = 8

    -- lay out the bricks such that they touch each other and fill the space 
    for y = 1, numRows do 
        for x = 1, numCols do
            b = Brick(
                -- x coordinate
                (x-1)                    --decrement x by 1 because tables are 1-indexed, coords are 0
                * 32                     -- multiply by 32 pixels of brick's width
                + 8                      -- the screen should have 8 pixels of padding; we can fit 13 cols + 16 pixels total
                + (13 - numCols) * 16,    -- left-side padding for when there are fewer than 13 columns
                -- y coordinates
                y * 16                  -- just use y * 16, since we need top padding anyway
            )

            table.insert(bricks, b)
        end
    end

    return bricks
  end
  