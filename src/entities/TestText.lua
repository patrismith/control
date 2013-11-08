local TestText = class:new()


function TestText:init(params)

   local params = params or {}

   self.x = params.x or 0
   self.y = params.y or 0
   self.w = params.w or 160
   self.text = params.text or ""
   self.align = params.align or "left"

end


function TestText:draw()

   love.graphics.setFont(constants.fonts.dialogue)
   love.graphics.setColor(48,0,0)
   love.graphics.printf(self.text, self.x, self.y, self.w, self.align)
   love.graphics.setColor(255,255,255)


end


return TestText
