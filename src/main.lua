debug = false

constants = require('constants')
statemanager = require('statemanager')
class = require('class')

State = require('states.State')

DialogueBox = require('entities.DialogueBox')
DialogueBoxSeries = require('entities.DialogueBoxSeries')
Sprite = require('entities.Sprite')
SpriteMovement = require('entities.SpriteMovement')
Pause = require('entities.Pause')
Input = require('entities.Input')


function love.load()

   constants:init()
   statemanager:init()

   love.graphics.setColorMode('replace')
   love.graphics.setLine(1,'rough')
   love.graphics.setFont(constants.fonts.dialogue)

end


function love.update(dt)

   statemanager:update(dt)

end


function love.draw()

   statemanager:draw()

end


function love.keypressed(key)

   statemanager:keypressed(key)

   -- toggle debug
   if key == "`" then
      debug = not debug
   end

end
