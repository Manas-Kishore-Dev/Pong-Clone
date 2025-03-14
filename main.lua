require "player"
require "ball"
require "computer"

function love.load()
    Player:load()
    Ball:load()
    Computer:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    Ball:collide()
    Computer:update(dt)
end 


function love.draw()
    Player:draw()
    Ball:draw()
    Computer:draw()
end



function CheckCollision(a,b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end