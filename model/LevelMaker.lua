--[[ 

-- LevelMaker Class

Creates randomized levels for Breakout Game.

Returns table of BRICK type objects. 

This will decide the difficulties levels of the brick structure.
 ]]

--  Global patterns (used to make the entire map a certain shape)
NONE = 1
SINGLE_PYRAMID = 2
MULTI_PYRAMID = 3

-- per row patterns:
SOLID = 1 -- all colors the same in this row
ALTERNATE = 2 -- alternate colors on this row
SKIP = 3 -- skip every other block
NONE = 4 -- no block in this row

 LevelMaker = Class{}

 --[[ 
    Creates a table of Brick type objects to be returned into main game,
    with differenct possible ways of rancomizing rows and columns of bricks.
    
    Calculates the brick colors and tiers to choose based on the level passed in.
  ]]

  function LevelMaker.createMap(level)
    local bricks = {}

    -- random choode the number of rows between 1 to 5
    local numRows = math.random(1,5)

    -- randomly choose number of columns (from 7 to 13) but NOW IT MUST BE ODD NUMBERS  :
    local numCols = math.random(7, 13)
    -- if (numCols % 2 == 0) then
    --   numCols = numCols + 1
    -- end
    numCols = numCols % 2 == 0 and (numCols + 1) or numCols

    -- now connect the tier with chosen level:
    -- this should spawned brick colors max = 3
    local highestTier = math.min(3, math.floor(level / 5))
    -- after level 15 it will start having higest tier = 3
    -- the tier will increase every 5 levels

    -- highest color of the highest tier:
    local highestColor = math.min(5, level % 5 + 3)
    -- the highest color will be reset back to 3 each 5 levels when tier is increasing


    -- lay out the bricks such that they touch each other and fill the space 
    for y = 1, numRows do 
      -- do we want have skipped brick(s) in the row
      local skipPattern = math.random(1,2) == 1 and true or false
      -- if the random number is 1 then skipPattern is true and false if 2

      -- do we want to have alternating colors in this row:
      local alternatePattern = math.random(1,2) == 1 and true or false
      -- NOTE: basically the choice is still in random

      -- choose 2 colors to alternate between
      local alternateColor1 = math.random(1, highestColor)
      local alternateColor2 = math.random(1, highestColor)
      -- NOTE: still in random possible to have the same alternateColor1 = alternateColor2
      local alternateTier1 = math.random(0, highestTier)
      local alternateTier2 = math.random(0, highestTier)

      -- use this only IF we want to skip a block, for skip pattern
      local skipFlag = math.random(2) == 1 and true or false

      -- use this only we want to alternate a block for alternate pattern:
      local alternateFlag = math.random(2) == 1 and true or false

      -- which solid color we will use if we're not alternating:
      local solidColor = math.random(1, highestColor)
      local solidTier = math.random(0, highestTier)

        for x = 1, numCols do
          -- if skipping is turned on and we're on a skip iteration:
          if skipPattern and skipFlag then
            -- turn off skipFlag (turn it into false) for the next iteration
            -- meaning the next iteration there will be brick
            skipFlag = not skipFlag

            -- continue to the next loop step but LUA doesn't have continue syntax, here is workaround:
            goto continue
          else
            -- flip the flag to true this time for the next iteration 
            -- for now we will still build the brick
            skipFlag = not skipFlag
          end

          b = Brick(
              -- x coordinate
              (x-1)                    --decrement x by 1 because tables are 1-indexed, coords are 0
              * 32                     -- multiply by 32 pixels of brick's width
              + 8                      -- the screen should have 8 pixels of padding; we can fit 13 cols + 16 pixels total
              + (13 - numCols) * 16,    -- left-side padding for when there are fewer than 13 columns
              -- y coordinates
              y * 16                  -- just use y * 16, since we need top padding anyway
          )

          -- if we're alternating, figure out which color and tier we're on:
          -- if alternatePattern is true then we have alternate pattern 
          -- and if alternate flag is true then we have alternateColor1 and alternateTier1 
          -- if alternate flag is false then we have to set color to alternateColor 2 and tier to alternateTier2
          -- don't forget to flip alternate flag each time
          if alternatePattern and alternateFlag then
            b:setColor(alternateColor1)
            b:setTier(alternateTier1)
            alternateFlag = not alternateFlag
          else
            b:setColor(alternateColor2)
            b:setTier(alternateTier2)
            alternateFlag = not alternateFlag
          end

          -- if not alternating and we made it here use the solid color/tier:
          if not alternatePattern then
            b:setColor(solidColor)
            b:setTier(solidTier)
          end

          table.insert(bricks, b)

          -- i'll put continue label here so that it will skip one iteration of a loop
          ::continue::
        end
    end

    -- return bricks when we create bricks in the case we don't then try again
    if #bricks == 0 then
      return self.createMap(level)
    else
      return bricks
    end
  end
  