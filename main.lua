function love.load() --this is where you store the variables
    x, y, speed = 100, 200, 200
    love.keyboard.setKeyRepeat(true) --enables love to work with key repeats
end

function love.update(dt) --does the game code thingies
    print(dt) --dt is the thing that makes movement constant and all of that, i aint gonna explain it here
        if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) then y = y - (speed * dt) end--by multiplying speed by dt, the movement is now constant for all computers
        if (love.keyboard.isDown("down") or love.keyboard.isDown("s")) then y = y + (speed * dt) end
        if (love.keyboard.isDown("left") or love.keyboard.isDown("a")) then x = x - (speed * dt) end
        if (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then x = x + (speed * dt) end
        if (love.keyboard.isDown("r")) then x, y = 100, 200 end
        if (love.keyboard.isDown("escape")) then love.event.quit() end --quits the game
end

function love.draw() --this is where you put the graphics
    love.graphics.rectangle("fill", x, y, 50, 50) --makes a filled square initialised at (100, 200) 
    love.graphics.print("Press R to return square") --graphics.print defaults to (0, 0)
    love.graphics.print("Press Esc to end simulation", 0, 15) --just slightly below the previous
end
