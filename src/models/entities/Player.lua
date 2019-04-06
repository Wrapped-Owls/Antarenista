local Player = {}; Player.__index = Player

function Player:new(world, Pixelurite)
    local this = setmetatable({
        body = love.physics.newBody(world, 10, 450, "dynamic"),
        shape = love.physics.newCircleShape(60),
        fixture = nil, speed = 150, orientation = 1,
        sprites = {
            casual = Pixelurite.configureSpriteSheet("casual_player", "assets/sprites/Player/", true, nil, 1, 1, true),
            militar = Pixelurite.configureSpriteSheet("militar_player", "assets/sprites/Player/", true, nil, 1, 1, true)
        }, currentSprite = "casual"
    }, Player)

    return this
end

function Player:keypressed(key, scancode, isrepeat)
    if key == "left" then self.orientation = -1 elseif key == "right" then self.orientation = 1 end
end

function Player:changeOutfit(name)
    if self.sprites[name] then self.currentSprite = name end
end

function Player:getPosition()
    return self.body:getX(), self.body:getY()
end

function Player:setPosition(x, y)
    if x then
        self.body:setX(x)
    end
    if y then
        self.body:setY(y)
    end
end

function Player:update(dt)
    self.sprites[self.currentSprite]:update(dt)
    self.body:setLinearVelocity(self.speed * (love.keyboard.isDown("left") and -1 or love.keyboard.isDown("right") and 1 or 0), 0)
end

function Player:draw()
    self.sprites[self.currentSprite]:draw(self.body:getX(), self.body:getY(), 2 * self.orientation, 2)
    --love.graphics.circle("line", self.body:getX(), self.body:getY(), 60)
end

return Player
