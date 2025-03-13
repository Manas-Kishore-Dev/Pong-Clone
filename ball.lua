Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()/2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    Ball.x = Ball.x + Ball.xVel * dt
    
end

function Ball:collide()
    if CheckCollision(Ball,Player) then
        Ball.xVel = Ball.speed
    end
end


function Ball:draw()
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end