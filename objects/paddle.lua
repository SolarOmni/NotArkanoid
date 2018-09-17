local vector = require("../libs/hump/vector")
local class = require("../libs/lowerclass/lowerclass")
local Paddle = class("Paddle")

function Paddle:initialize()
  self.position = vector(500, 560)
  self.width = 100
  self.height = 7
  self.speed = 400
end

function Paddle:update(dt, world)
  if love.keyboard.isDown("left") then
    local newX = self.position.x - (self.speed * dt)
    local actualX, actualY, cols, len = world:move(self, newX, self.position.y)
    self.position.x = actualX
  end

  if love.keyboard.isDown("right") then
    local newX = self.position.x + (self.speed * dt)
    local actualX, actualY, cols, len = world:move(self, newX, self.position.y)
    self.position.x = actualX
  end
end

return Paddle
