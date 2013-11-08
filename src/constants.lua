local constants = {}

-----------------

local img = love.graphics.newImage('assets/littlefont.png')
img:setFilter("nearest","nearest")

-----------------

function constants:init()

   self.fonts = {}
   self.fonts.dialogue = love.graphics.newImageFont(img, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.,!'\"-:?")


   self.colors = { {0,0,46},
                   {143,130,143},
                   {245,193,193},
                   {255,248,224} }

   self.portraits = {}
   self.portraits.professor = love.graphics.newImage('assets/professor-portrait.png')
   self.portraits.assistant = love.graphics.newImage('assets/assistant-portrait.png')
   self.portraits.player = love.graphics.newImage('assets/player-robot-portrait.png')

   self.sprites = {}
   self.sprites.professor = love.graphics.newImage('assets/professor-sprite.png')
   self.sprites.assistant = love.graphics.newImage('assets/assistant-sprite.png')
   self.sprites.player = love.graphics.newImage('assets/robot.png')
   self.sprites.scientist01 = love.graphics.newImage('assets/scientist1-sprite.png')
   self.sprites.scientist02 = love.graphics.newImage('assets/scientist2-sprite.png')
   self.sprites.monster = love.graphics.newImage('assets/monster-sprite.png')

   self.bg = {}
   self.bg.test = love.graphics.newImage('assets/testbg.png')
   self.bg.testcaves = love.graphics.newImage('assets/testcavebg.png')
   self.bg.lab = love.graphics.newImage('assets/lab.png')
   self.bg.lab:setFilter("nearest","nearest")
   self.bg.caves = love.graphics.newImage('assets/caves.png')
   self.bg.caves:setFilter("nearest","nearest")


end


return constants
