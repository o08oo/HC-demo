HC = require 'HC'

-- array to hold collision messages
local text = {}

function love.load()
    -- add a rectangle to the scene
    rect = HC.rectangle(200,400,400,20)

    -- add a circle to the scene
    mouse = HC.rectangle(400,300,16,16)
    mouse:moveTo(200,300)
end

function love.update(dt)

local speed = 200;
if love.keyboard.isDown("down") then
    mouse:move(0, speed*dt)
	end
  if love.keyboard.isDown("up") then
    mouse:move(0, -speed*dt)
  end

  if love.keyboard.isDown("right")  then
    mouse:move(speed*dt, 0)
	end
  if love.keyboard.isDown("left") then
    mouse:move(-speed*dt, 0)
  end

    -- move circle to mouse position
   -- mouse:moveTo(love.mouse.getPosition())

    -- rotate rectangle
    --rect:rotate(dt)

    -- check for collisions
    for shape, delta in pairs(HC.collisions(mouse)) do
        --text[#text+1] = string.format("Colliding. Separating vector = (%s,%s)",delta.x, delta.y)
		mouse:move(delta.x, delta.y)
    end

    while #text > 40 do
        table.remove(text, 1)
    end
end

function love.draw()
    -- print messages
    for i = 1,#text do
        love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
        love.graphics.print(text[#text - (i-1)], 10, i * 15)
    end

    -- shapes can be drawn to the screen
    love.graphics.setColor(255,255,255)
    rect:draw('fill')
    mouse:draw('fill')
end