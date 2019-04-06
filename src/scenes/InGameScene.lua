local InGameScene = {}

InGameScene.__index = InGameScene

function InGameScene:new(world)
    local this = setmetatable({
        fonts = {
            default = love.graphics.getFont()
        },
        plotScripts = require "models.value.PlotScripts":new(),
        world = world, textBox = nil,
    }, InGameScene)
    this:generateTextBox(1, 1)
    sceneDirector:addScene("miniGames", require "scenes.MiniGameScene":new(world))
    sceneDirector:addSubscene("pause", require "scenes.subscenes.PauseGame":new())
    sceneDirector:addSubscene("gameOver", require "scenes.subscenes.GameOver":new())
    return this
end

function InGameScene:generateTextBox(level, stage)
    local texts = self.plotScripts:getPlot(level, stage)
    self.textBox = gameDirector:getLibrary("TextBox"):new(texts, gameDirector:getLibrary("Scribe"), self)
end

function InGameScene:deleteTextBox()
    self.textBox = nil
    sceneDirector:switchScene("miniGames")
end

function InGameScene:keypressed(key, scancode, isrepeat)
    if self.textBox then
        self.textBox:keypressed(key, scancode, isrepeat)
    end
end

function InGameScene:keyreleased(key, scancode)
end

function InGameScene:mousemoved(x, y, dx, dy, istouch)
end

function InGameScene:mousepressed(x, y, button, istouch)
    if self.textBox then
        self.textBox:mousepressed(x, y, button, istouch)
    end
end

function InGameScene:mousereleased(x, y, button, istouch)
end

function InGameScene:reset()
    gameDirector:reset()
end

function InGameScene:update(dt)
    gameDirector:getPlayer():update(dt)
    gameDirector:update(dt)
end

function InGameScene:draw()
    if self.textBox then
        self.textBox:draw()
    end
    gameDirector:getPlayer():draw()
end

return InGameScene
