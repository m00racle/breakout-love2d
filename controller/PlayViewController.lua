--[[ 
    Base Contorller will handle the update and user inputs on the program runs

    The implementation of this class must be the 2nd argument to the BaseStateHandler implementation
 ]]

 PlayViewController = Class{}

function PlayViewController:update(dt) 
    -- TODO test if the state is in pause or not.
    -- TODO handles the user inputs depending on pause states or not.

    -- TODO forwarnd the dt to Paddle class update function

    -- TODO handle escape key to quit. <-- subject for revision you should not give the player power to just quit in the middle of the play.
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end