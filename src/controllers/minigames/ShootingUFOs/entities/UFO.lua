local UFO = {}; UFO.__index = UFO

function UFO:new(animation)
    love.math.setRandomSeed(love.timer.getTime())
    local this = setmetatable({
        animation = animation,
        x = love.math.random(200, 600),
        y = love.math.random(100, 500)
    }, UFO)

    return this
end

function UFO:isColliding(x, y)
    return (x <= self.x + 16 and x >= self.x - 16) and (y >= self.y - 16 and y <= self.y + 16)
end

function UFO:update(dt)
    self.animation:update(dt)
end

function UFO:draw()
    self.animation:draw(self.x, self.y, 2, 2)
end

return UFO
