local MiniGameScene = {}

MiniGameScene.__index = MiniGameScene

function MiniGameScene:new(world)
    local this = setmetatable({
        world = world, currentMinigame = nil,
        minigames = {
            ShootingUFOs = require "controllers.minigames.ShootingUFOs":new()
        }
    }, MiniGameScene)
    this.currentMinigame = this.minigames.ShootingUFOs
    return this
end

function MiniGameScene:keypressed(key, scancode, isrepeat)
    if self.currentMinigame.keypressed then
        self.currentMinigame:keypressed(key, scancode, isrepeat)
    end
end

function MiniGameScene:mousemoved(x, y, dx, dy, istouch)
    if self.currentMinigame.mousemoved then
        self.currentMinigame:mousemoved(x, y, dx, dy, istouch)
    end
end

function MiniGameScene:mousepressed(x, y, button, istouch)
    if self.currentMinigame.mousepressed then
        self.currentMinigame:mousepressed(x, y, button, istouch)
    end
end

function MiniGameScene:mousereleased(x, y, button, istouch)
    if self.currentMinigame.mousereleased then
        self.currentMinigame:mousereleased(x, y, button, istouch)
    end
end

function MiniGameScene:reset()
    if self.currentMinigame.reset() then
        self.currentMinigame:reset()
    end
end

function MiniGameScene:update(dt)
    self.currentMinigame:update(dt)
end

function MiniGameScene:draw()
    self.currentMinigame:draw()
end

return MiniGameScene
