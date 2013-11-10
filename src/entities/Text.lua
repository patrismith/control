local Text = class:new()


function Text:init(params)

   local params = params or {}

   self.x = params.x or 0
   self.y = params.y or 0
   self.w = params.w or 160
   self.text = params.text or ""
   self.color = params.color or constants.colors[1]
   self.align = params.align or "left"
   -- i am lazy and it's getting near the deadline
   self.credits = params.credits or false

end


function Text:move(x,y)
   if x then
      self.x = self.x + x
   end
   if y then
      self.y = self.y + y
   end
end


function Text:draw()

   if self.credits then
      love.graphics.setColor(constants.colors[1])
      love.graphics.rectangle("fill",0,0,160,144)
   end
   love.graphics.setFont(constants.fonts.dialogue)
   love.graphics.setColor(self.color)
   love.graphics.printf(self.text, self.x, self.y, self.w, self.align)
   love.graphics.setColor(255,255,255)


end


return Text
