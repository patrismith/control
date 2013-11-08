local Pause = class:new()


function Pause:init(params)

   local params = params

   self.howlong = params.howlong or nil
   self.curr = 0
   -- this optional function will be performed while the pause counts down
   self.f = params.f or nil
   -- this optional function will be performed upon completion of the pause
   self.done = params.done or nil

end


function Pause:update(dt)

   self.curr = self.curr + 1
   if self.curr > self.howlong then
      if self.done then self.done() end
      self.active = false
   elseif self.f then
      self.f()
   end


end


return Pause
