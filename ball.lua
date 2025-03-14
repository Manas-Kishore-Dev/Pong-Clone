Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.direction = -1
    self.ydirection = 1
    self.xVel = self.speed
    self.yVel = 0
end

function Ball:update(dt)
    Ball:BoundryCollision()
    Ball.x = Ball.x + Ball.xVel * dt * Ball.direction
    Ball.y = Ball.y + Ball.yVel * dt * 0.2 * Ball.ydirection
end

function Ball:collide()
    if CheckCollision(Ball, Player) then
        Ball.direction = 1
        Ball:ChangeYVel()
    end
end

function Ball:ChangeYVel()
    self.yVel = Player.speedY
end

function Ball:BoundryCollision()
    if Ball.x < 0  then
        self.ydirection = 1
    elseif Ball.x + Ball.height > love.graphics.getHeight() then
        self.ydirection = -1
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
