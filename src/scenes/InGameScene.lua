local InGameScene = {}

InGameScene.__index = InGameScene

function InGameScene:new(world)
    local this = {
        fonts = {
            default = love.graphics.getFont()
        },
        world = world,
    }
    sceneDirector:addSubscene("pause", require "scenes.subscenes.PauseGame":new())
    sceneDirector:addSubscene("gameOver", require "scenes.subscenes.GameOver":new())
    return setmetatable(this, InGameScene)
end

function InGameScene:keypressed(key, scancode, isrepeat)
end

function InGameScene:keyreleased(key, scancode)
end

function InGameScene:mousemoved(x, y, dx, dy, istouch)
end

function InGameScene:mousepressed(x, y, button, istouch)
end

function InGameScene:mousereleased(x, y, button, istouch)
end

function InGameScene:reset()
    gameDirector:reset()
end

function InGameScene:update(dt)
    gameDirector:update(dt)
end

function InGameScene:draw()
end

return InGameScene
