local currentPath   = (...):gsub('%.init$', '') .. "."
local UFO = require(string.format("%sentities.UFO", currentPath))

local GameController = {}; GameController.__index = GameController

function GameController:new()
    local this = setmetatable({
        background = love.graphics.newImage("assets/sprites/ShootingUFOs/background.png"),
        cross_hair = love.graphics.newImage("assets/sprites/ShootingUFOs/cross-hair.png"),
        ufoSprite = gameDirector:getLibrary("Pixelurite").configureSpriteSheet("UFOs", "assets/sprites/ShootingUFOs/", true, nil, 1, 1, true),
        elapsedTime = 0, crossPosition = {x = -400, y = -300}, score = 0
    }, GameController)
    this.ufo = UFO:new(this.ufoSprite)
    return this
end

function GameController:generateUFO()
    self.ufo = UFO:new(self.ufoSprite)
end

function GameController:keypressed(key, scancode, isrepeat)
    if key == "space" then
        if self.ufo:isColliding(self.crossPosition.x + 800, self.crossPosition.y + 600) then
            self:generateUFO(); self.score = self.score + 1
        end
    elseif key == "escape" and self.score >= 10 then
        sceneDirector:previousScene()
    end
end

function GameController:update(dt)
    self.elapsedTime = self.elapsedTime + dt
    if self.elapsedTime >= 0.02 then
        self.elapsedTime = 0
        self.crossPosition.x = self.crossPosition.x + 10 * (love.keyboard.isDown("left") and -1 or love.keyboard.isDown("right") and 1 or 0)
        self.crossPosition.y = self.crossPosition.y + 10 * (love.keyboard.isDown("up") and -1 or love.keyboard.isDown("down") and 1 or 0)
    end
    self.ufo:update(dt)
end

function GameController:draw()
    love.graphics.draw(self.background, 0, 0, r, 5, 5, ox, oy)
    self.ufo:draw()
    love.graphics.draw(self.cross_hair, self.crossPosition.x, self.crossPosition.y, r, 5, 5, ox, oy)
end

return GameController
