local PauseGame = {}

PauseGame.__index = PauseGame

function PauseGame:new()
    local this = {
        args = ""
    }

    return setmetatable(this, PauseGame)
end

function PauseGame:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        sceneDirector:exitSubscene()
    end
end

function PauseGame:draw()
end

return PauseGame
