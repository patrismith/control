local Fader = class:new()


function Fader:init(params)

   local params = params

   if params.coming then
      self.x = 0
      self.arriving = true
      self.leaving = false
   else
      self.nextState = params.state
      self.x = 160
      self.arriving = false
      self.leaving = true
   end

end


function Fader:update(dt)

   if self.arriving then
      self.x = self.x + 10
      if self.x >= 160 then
         self.active = false
      end
   elseif self.leaving then
      self.x = self.x - 10
      if self.x <= 0 then
         statemanager.nextState(self.nextState)
         self.active = false
      end
   end

end


function Fader:draw()

   if self.arriving or self.leaving then
      love.graphics.setColor(constants.colors[1])
      love.graphics.rectangle("fill",self.x,0,160,144)
      love.graphics.setColor(255,255,255)
   end

end

return Fader
