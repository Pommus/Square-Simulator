function love.load() --this is where you store the variables
    x, y, speedX, speedY, toggle = 100, 200, 0, 0, true --added toggle bool
end

function love.update(dt) --does the game code thingies
	local accelerationX, accelerationY = 0, 0 --and thus, acceleration was born
	if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) then accelerationY = -10 * dt --by multiplying speed by dt, the movement is now constant for all computers
	elseif (love.keyboard.isDown("down") or love.keyboard.isDown("s")) then accelerationY = 10 * dt
	elseif (love.keyboard.isDown("left") or love.keyboard.isDown("a")) then accelerationX = -10 * dt 
	elseif (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then accelerationX = 10 * dt 
    	elseif (love.keyboard.isDown("r")) then x, y, speedX, speedY, accelerationX, accelerationY = 100, 200, 0, 0, 0, 0 
    	elseif (love.keyboard.isDown("escape")) then love.event.quit()  --quits the game
	elseif (love.keyboard.isDown("f")) then --this toggles the fullscreen 
		love.window.setFullscreen(toggle)
		toggle = not toggle
    	else  --yay the stopping works now! it will check if the speed is less than 1 and greater than -1 and set the speed to zero, making it stop with some fluidity 
		if (speedX > -1 and speedX < 1 and speedX ~= 0) then speedX = 0   
		elseif (speedY > -1 and speedY < 1 and speedY ~= 0) then speedY = 0 end
	end
	print(x .. " " .. y  .. " " .. accelerationX .. " " .. accelerationY .. " " .. speedX .." " .. speedY)
    	speedX, speedY = speedX + accelerationX, speedY + accelerationY
    	x, y = x + speedX, y + speedY
end

function love.draw() --this is where you put the graphics
    love.graphics.rectangle("fill", x, y, 50, 50) --makes a filled square initialised at (100, 200) 
    love.graphics.print("Press R to return square") --graphics.print defaults to (0, 0)
    love.graphics.print("Press Esc to end simulation", 0, 15) --just slightly below the previous
    love.graphics.print("Press F to toggle fullscreen", 0, 30)
    love.graphics.print("Horizontal Speed: " .. speedX .. "\n" .. "Vertical Speed: " .. speedY, 0, love.graphics.getHeight() - 30)
    --this stays in place even when the fullscreen is toggled or the window is resized! really cool.
end
