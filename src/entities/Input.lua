local Input = class:new()


function Input:init(params)

   local params = params

   self.k = params.k or nil
   self.f = params.f or nil
   self.g = params.g or nil

end


function Input:keypressed(key)

   -- go to sleep then fix this so if there is self.altf, it is called if anything other than self.k is pressed, unless self.k isn't set, in which case call self.f if anything is pressed
   if self.k then
      if key == self.k then
         self.f()
         self.active = false
      elseif self.g then
         self.g()
      end
   elseif not self.k then
      -- for pressing any key
      self.f()
      self.active = false
   end

end


return Input
