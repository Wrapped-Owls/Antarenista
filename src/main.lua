local GameDirector = require "controllers.GameDirector"
local ScaleDimension = require "util.ScaleDimension"

function love.load()
    --set default constants
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --Creating Main Controllers
    scaleDimension = ScaleDimension:new()
    scaleDimension:setGameScreenScale(800, 600)
    gameDirector = GameDirector:new()
    sceneDirector = gameDirector:getLibrary("MoonJohn").MoonJohn:new(require "scenes.SplashScreen":new())
    sceneDirector:setDefaultTransition(function() return gameDirector:getLibrary("MoonJohn").Transitions:FadeOut() end)
    --Adding Scenes to SceneDirector
    sceneDirector:addScene("mainMenu", require "scenes.MainMenuScene":new())
    sceneDirector:addScene("credits", require "scenes.CreditsScene":new())
    sceneDirector:addScene("inGame", require "scenes.InGameScene":new(gameDirector:getWorld()))
end

function love.keypressed(key, scancode, isrepeat)
    sceneDirector:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
    sceneDirector:keyreleased(key, scancode)
end

function love.mousemoved(x, y, dx, dy, istouch)
    sceneDirector:mousemoved(x, y, dx, dy, istouch)
end

function love.mousepressed(x, y, button)
    sceneDirector:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    sceneDirector:mousereleased(x, y, button)
end

function love.wheelmoved(x, y)
    sceneDirector:wheelmoved(x, y)
end

function love.update(dt)
    sceneDirector:update(dt)
end

function love.draw()
    sceneDirector:draw()
    --love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end

function love.resize(w, h)
    scaleDimension:screenResize(w, h)
    sceneDirector:resize(w, h)
end
