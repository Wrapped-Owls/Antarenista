local InGameScene = {}

InGameScene.__index = InGameScene

function InGameScene:new(world)
    local this = setmetatable({
        fonts = {
            default = love.graphics.getFont()
        },
        scenaries = {
            museum = love.graphics.newImage("assets/sprites/misc/museum.png"),
            home = love.graphics.newImage("assets/sprites/misc/home.png")
        },
        objects = nil,
        currentScenary = "home", music = love.audio.newSource("assets/sounds/Sad_Music.wav", "static"),
        plotScripts = require "models.value.PlotScripts":new(), hasMinigame = false,
        world = world, textBox = nil,
    }, InGameScene)
    this.objects = {
        museum = {

        }, home = {
            {min = 590, max = 720, callback = function() this:generateTextBox(1, 1) end, alredyPressed = false}
        }
    }
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
    if self.hasMinigame then self:openMinigame(); self.hasMinigame = false end
end

function InGameScene:openMinigame(stage)
    sceneDirector:switchScene("miniGames")
    self.music:pause(); nextWord = stage
end

function InGameScene:keypressed(key, scancode, isrepeat)
    if self.textBox then
        self.textBox:keypressed(key, scancode, isrepeat)
    else
        gameDirector:getPlayer():keypressed(key, scancode, isrepeat)
    end
    if key == "space" then
        local x, y = gameDirector:getPlayer():getPosition()
        print(x, y)
        for _, info in pairs(self.objects[self.currentScenary]) do
            if (x >= info.min and x <= info.max) and not info.alredyPressed then
                info.alredyPressed = true; info.callback()
            end
        end
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
    self.music:play()
    gameDirector:getPlayer():update(dt)
    if gameDirector:getPlayer():getPosition() >= 780 then
        self.currentScenary = "museum"
        gameDirector:getPlayer():setPosition(50, nil)
        self:generateTextBox(1, 2); self.hasMinigame = true
    end
    gameDirector:update(dt)
end

function InGameScene:draw()
    love.graphics.draw(self.scenaries[self.currentScenary], 0, 0)
    gameDirector:getPlayer():draw()
    if self.textBox then
        self.textBox:draw()
    end
end

return InGameScene
