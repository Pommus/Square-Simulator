function love.load() --this is where you store the variables
    x, y, speedX, speedY = 100, 200, 0, 0
end

function love.update(dt) --does the game code thingies
	local accelerationX, accelerationY = 0, 0
	print(x .. " " .. y  .. " " .. speedX .. " " .. speedY)
        if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) then accelerationY = -10 * dt --by multiplying speed by dt, the movement is now constant for all computers
	elseif (love.keyboard.isDown("down") or love.keyboard.isDown("s")) then accelerationY = 10 * dt
	elseif (love.keyboard.isDown("left") or love.keyboard.isDown("a")) then accelerationX = -10 * dt 
	elseif (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then accelerationX = 10 * dt 
	elseif (love.keyboard.isDown("r")) then x, y, speedX, speedY, accelerationX, accelerationY = 100, 200, 0, 0, 0, 0 
	elseif (love.keyboard.isDown("escape")) then love.event.quit()  --quits the game
	else 
		if (speedY > 0) then accelerationY = -10 * dt
		elseif (speedX > 0) then accelerationX = -10 * dt
		elseif (speedY < 0) then accelerationY = 10 * dt
		elseif (speedX < 0) then accelerationX = 10 * dt end
	end
	speedX, speedY = speedX + accelerationX, speedY + accelerationY
	x, y = x + speedX, y + speedY
end

function love.draw() --this is where you put the graphics
    love.graphics.rectangle("fill", x, y, 50, 50) --makes a filled square initialised at (100, 200) 
    love.graphics.print("Press R to return square") --graphics.print defaults to (0, 0)
    love.graphics.print("Press Esc to end simulation", 0, 15) --just slightly below the previous
end
