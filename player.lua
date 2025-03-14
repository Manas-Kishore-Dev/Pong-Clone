Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.width = 10
    self.height = 100
    self.speed = 500
    self.prevY = self.y -- Store the initial y position
    self.speedY = 0 -- Initialize the speed in the y direction
end

function Player:move(dt)
    -- movement controls
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
end

function Player:update(dt)
    -- adding the controls
    Player:move(dt)
    -- limiting moving area
    if self.y < 0 then
        self.y = 0
    elseif self.y > love.graphics.getHeight() - 100 then
        self.y = love.graphics.getHeight() - 100
    end

    -- Calculate the speed in the y direction
    self.speedY = (self.y - self.prevY) / dt
    self.prevY = self.y -- Update the previous y position

    
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.print("Player Speed: " .. self.speedY, 10, 10)
end