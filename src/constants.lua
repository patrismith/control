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
   self.portraits.loudspeaker = love.graphics.newImage('assets/loudspeaker-portrait.png')
   self.portraits.villain = love.graphics.newImage('assets/npc-robot-portrait.png')

   self.sprites = {}
   self.sprites.professor = love.graphics.newImage('assets/professor-sprite.png')
   self.sprites.assistant = love.graphics.newImage('assets/assistant-sprite.png')
   self.sprites.player = love.graphics.newImage('assets/robot.png')
   self.sprites.scientist01 = love.graphics.newImage('assets/scientist1-sprite.png')
   self.sprites.scientist02 = love.graphics.newImage('assets/scientist2-sprite.png')
   self.sprites.monster = love.graphics.newImage('assets/monster-sprite.png')
   self.sprites.villain = love.graphics.newImage('assets/robot.png')
   self.sprites.villaingun = love.graphics.newImage('assets/robot-gun.png')
   self.sprites.bullet = love.graphics.newImage('assets/bullet.png')
   self.sprites.deadprofessor = love.graphics.newImage('assets/professor-dead-sprite.png')
   self.sprites.deadassistant = love.graphics.newImage('assets/assistant-dead-sprite.png')

   self.bg = {}
   self.bg.test = love.graphics.newImage('assets/testbg.png')
   self.bg.testcaves = love.graphics.newImage('assets/testcavebg.png')
   self.bg.splash = love.graphics.newImage('assets/splash.png')
   self.bg.splash:setFilter("nearest","nearest")
   self.bg.logo = love.graphics.newImage('assets/logo.png')
   self.bg.logo:setFilter("nearest","nearest")
   self.bg.lab = love.graphics.newImage('assets/lab.png')
   self.bg.lab:setFilter("nearest","nearest")
   self.bg.village = love.graphics.newImage('assets/village.png')
   self.bg.village:setFilter("nearest","nearest")
   self.bg.caves = love.graphics.newImage('assets/caves.png')
   self.bg.caves:setFilter("nearest","nearest")
   self.bg.lastcave = love.graphics.newImage('assets/lastcave.png')
   self.bg.lastcave:setFilter("nearest","nearest")

   self.music = {}
   self.music.splash = love.audio.newSource('assets/splash.ogg')
   self.music.splash:setLooping(true)
   self.music.lab = love.audio.newSource('assets/lab.ogg')
   self.music.lab:setLooping(true)
   self.music.explosion = love.audio.newSource('assets/explosion.ogg')
   self.music.escape = love.audio.newSource('assets/escape.ogg')
   self.music.escape:setLooping(true)
   self.music.caves = love.audio.newSource('assets/caves.ogg')
   self.music.caves:setLooping(true)
   self.music.robot = love.audio.newSource('assets/robot.ogg')
   self.music.robot:setLooping(true)
   self.music.lastcave = love.audio.newSource('assets/lastcave.ogg')
   self.music.lastcave:setLooping(true)
   self.music.shoot = love.audio.newSource('assets/shoot.ogg')
   self.music.evilrobot = love.audio.newSource('assets/evilrobot.ogg')
   self.music.evilrobot:setLooping(true)
   self.music.credits = love.audio.newSource('assets/credits.ogg')
   self.music.credits:setLooping(true)


end


return constants
