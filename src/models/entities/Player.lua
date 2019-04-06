local Player = {}; Player.__index = Player

function Player:new(world)
    local this = setmetatable({
        body = love.physics.newBody(world, 10, 520, "dynamic"),
        shape = love.physics.newCircleShape(10),
        fixture = nil, sprite = nil, speed = 150
    }, Player)

    return this
end

function Player:update(dt)
    self.body:setLinearVelocity(self.speed * (love.keyboard.isDown("left") and -1 or love.keyboard.isDown("right") and 1 or 0), 0)
end

function Player:draw()
    love.graphics.circle("fill", self.body:getX(), self.body:getY(), 10)
end

return Player
