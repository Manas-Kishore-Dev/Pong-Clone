require "ball"

Computer = {}

function Computer:load()
    self.x = love.graphics.getWidth() - 50
    self.y = love.graphics.getHeight() / 2
    self.width = 10
    self.height = 100
    self.speed = 500
    self.target = 0
    self.timer = 0
    self.rate = 0.5
    self.yVel = 0
end

function Computer:update(dt)
    self.y = self.y + self.yVel * dt 
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timmer = 0
        Computer:acquireTarget()
    end
end

function Computer:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Computer:acquireTarget()
    if self.y > Ball.y + Ball.height then
        self.yVel = - self.speed 
    elseif self.y + self.height < Ball.y then
        self.yVel = self.speed
    else 
        self.yVel = 0
    end
end
