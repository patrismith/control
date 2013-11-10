local DialogueBox = class:new()


function DialogueBox:init(params)

   local params = params or {}

   self.x = params.x or 0
   self.y = params.y or 96
   self.w = params.w or 160
   self.h = params.h or 48
   self.text = params.text or ""
   self.currtext = ""
   self.textcounter = 1
   self.img = params.img
   self.complete = false

end


function DialogueBox:update(dt)

   if self.textcounter <= self.text:len() then
      self.currtext = self.text:sub(1,self.textcounter)
      self.textcounter = self.textcounter + 1
   else
      self.complete = true
   end

end


function DialogueBox:box(x,y,w,h)

   love.graphics.setColor(constants.colors[1])
   love.graphics.rectangle("fill", x, y, w, h)

   love.graphics.setColor(constants.colors[3])
   love.graphics.rectangle("fill", x + 2, y + 2, w - 4, h - 4)

   love.graphics.setColor(constants.colors[1])
   love.graphics.rectangle("fill", x + 4, y + 4, w - 8, h - 8)

   love.graphics.setColor(constants.colors[4])
   love.graphics.rectangle("line", x + 3, y + 3, w - 5,  h - 6)

   love.graphics.setColor(constants.colors[4])
   love.graphics.rectangle("fill", x + 6, y + 6, w - 12, h - 12)

   love.graphics.setColor(255,255,255)

end


function DialogueBox:textbox(x,w)

   self:box(x,self.y,w,self.h)
   love.graphics.setColor(constants.colors[1])
   love.graphics.printf(self.currtext, x + 11, self.y + 11, w - 23, "left")

end


function DialogueBox:imagebox(x,w)

   self:box(x,self.y,w,self.h)

   if self.img then
      love.graphics.draw(self.img, x + 6 ,self.y + 6)
   end

end


function DialogueBox:draw()

   love.graphics.setColor(255,255,255)

   self:imagebox(0,48)
   self:textbox(48,112)

   love.graphics.setColor(255,255,255)

end


return DialogueBox
