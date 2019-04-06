local TextBox = {}; TextBox.__index = TextBox

function callback(self)
    return function(x, y, button, op, param)
        if self.index <= #self.texts then
            self.index = self.index + 1
            self:textbox:setText(self.texts[self.index])
        end
    end
end

function TextBox:new(texts, Scribe)
    local this = setmetatable({
        texts = texts, index = 1, font = love.graphics.getFont()
    }, TextBox)
    this.textbox = Scribe({
        text = texts[1],
        y = (love.graphics.getHeight() - ( this.font:getHeight() * 4 ) - 10 ) - ( 10 * 2 )
        w = love.graphics.getWidth() - 10 - 10,
        h = ( this.font:getHeight() * 4 ) + ( 10 * 2 ),
        x = 10,
        color = { 255, 255, 255 },
        click_callback = callback(this)
    })
    return this
end

function TextBox:update(dt)
    self.textbox:update(dt)
end

function TextBox:draw()
    self.textbox:draw()
end

function TextBox:mousepressed( x, y, b )
	self.textbox:mousepressed( x, y, b )
end

return TextBox
