local TextBox = {}; TextBox.__index = TextBox

function TextBox:new(texts, Scribe, parent)
    local this = setmetatable({
        texts = texts, index = 1, font = love.graphics.getFont(),
        scribeParameters = {
            text = texts[1],
            x = 10,
            color = {1, 1, 1}
        }, parent = parent
    }, TextBox)
    this.scribeParameters.y = (love.graphics.getHeight() - (this.font:getHeight() * 4 ) - 10) - (10 * 2)
    this.scribeParameters.w = love.graphics.getWidth() - 10 - 10
    this.scribeParameters.h = (this.font:getHeight() * 4) + ( 10 * 2 )
    this.textbox = Scribe(this.scribeParameters)
    return this
end

function TextBox:changeText()
    if self.index < #self.texts then
        self.index = self.index + 1
        self.textbox:setText(self.texts[self.index])
    else
        self.parent:deleteTextBox()
    end
end

function TextBox:keypressed(key, scancode, isrepeat)
    if key == "space" then
        self:changeText()
    end
end

function TextBox:update(dt)
    self.textbox:update(dt)
end

function TextBox:draw()
    self.textbox:draw()
end

function TextBox:mousepressed(x, y, button)
    self:changeText()
end

return TextBox
