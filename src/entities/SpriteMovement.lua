local SpriteMovement = class:new()


function SpriteMovement:init(params)

   local params = params

   self.origx = params.origx or nil
   self.origy = params.origy or nil
   self.targx = params.targx or nil
   self.targy = params.targy or nil

end


function SpriteMovement:change(ov, tv)

   if ov and tv then
      if ov < tv then
         ov = ov + 1
      elseif ov > tv then
         ov = ov - 1
      else
         self.active = false
      end
   end

end


function SpriteMovement:update(dt)

   self:change(origx, targx)
   self:change(origy, targy)

end


return SpriteMovement
