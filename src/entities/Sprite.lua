local Sprite = class:new()


function Sprite:init(params)

   local params = params

   self.x = params.x or 0
   self.origx = params.x or 0
   self.y = params.y or 0
   self.img = params.img
   self.exploding = 0
   self.flipped = params.flipped or false
   self.visible = true

end


function Sprite:move(x,y)
   if x then
      self.x = self.x + x
   end
   if y then
      self.y = self.y + y
   end
end


function Sprite:explosion()

   if self.x >= self.origx then self.x = self.x - 2
   elseif self.x < self.origx then self.x = self.x + 2
   end

end


function Sprite:die()

   self.visible = not self.visible

end

function Sprite:update(dt)

end


function Sprite:draw()

   love.graphics.setColor(255,255,255)
   if self.visible then
      if self.flipped then
      -- 16 here is the width of all the sprites
      -- if the flipped feature is to be used for a different-sized image,
      -- change this 16 to be the width of the sprite
      -- somehow i'm too lazy to do that now but not too lazy to write this comment
         love.graphics.draw(self.img, self.x, self.y, 0, -1, 1, 16, 0)
      else
         love.graphics.draw(self.img, self.x, self.y)
      end
   end

end


return Sprite
