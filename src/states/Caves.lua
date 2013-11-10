local Caves = State:new()

Caves.music = constants.music.caves

Caves.objectList = { bg = Sprite:new(),
                     entryfader = Fader:new(),
                     exitfader = Fader:new(),
                     professor = Sprite:new(),
                     assistant = Sprite:new(),
                     player = Sprite:new(),
                     wait01 = Pause:new(),
                     wait02 = Pause:new(),
                     wait03 = Pause:new(),
                     convo01 = DialogueBoxSeries:new(),
                     convo02 = DialogueBoxSeries:new(),
                     convo03 = DialogueBoxSeries:new(),
                     -- assistant and professor come onscreen
                     move01 = Pause:new(),
                     -- professor approaches robot
                     move02 = Pause:new(),
                     -- professor jumps back
                     move03 = Pause:new(),
                     -- robot shakes
                     move04 = Pause:new(),
                     -- assistant moves closer
                     move05 = Pause:new(),
                     -- this dialogue will be reactions to the robot moving thru the cave
                     -- if you press a dir. other than right, you will get yelled at :)
                     -- when player.x hits a certain point the other characters will follow
                     goright = DialogueBoxSeries:new(),
                   }

Caves.paramList = { bg = { img = constants.bg.caves },
                    entryfader = {coming = true},
                    exitfader = {state = "LastCave"},
                    professor = { x = -30,
                                  y = 70,
                                  img = constants.sprites.professor },
                    assistant = { x = -50,
                                  y = 70,
                                  img = constants.sprites.assistant },
                    player = { x = 100,
                               y = 70,
                               img = constants.sprites.player },
                    convo01 = {
                       { "What's in\nthese\ncaves?",
                         constants.portraits.assistant },
                       { "Well,\nbesides the\nobvious,",
                         constants.portraits.professor },
                       { "I have an\nold robot\nprototype\nstored here",
                         constants.portraits.professor },
                       { "that may\nhelp us\nescape.",
                         constants.portraits.professor }
                    },
                    wait01 = { howlong = 30 },
                    wait02 = { howlong = 70 },
                    wait03 = { howlong = 100 },
                    convo02 = {
                       { "There!",
                         constants.portraits.professor }
                    },
                    move01 = { f = function()
                                  Caves.objectList.professor:move(1)
                                  Caves.objectList.assistant:move(1)
                               end,
                               howlong = 60 },
                    move02 = { f = function()
                                  Caves.objectList.professor:move(1)
                             end,
                             howlong = 65 },
                    move03 = { f = function()
                                  Caves.objectList.professor:move(-1)
                                end,
                                howlong = 10 },
                    move04 = { f = function()
                                  Caves.objectList.player:explosion()
                               end,
                               howlong = 10 },
                    move05 = { f = function()
                                  Caves.objectList.assistant:move(1)
                                 end,
                               howlong = 25 },
                    convo03 = {
                       { "AM...\nI...\nAWAKE...",
                         constants.portraits.player },
                       { "It's\nspooky...",
                         constants.portraits.assistant },
                       { "Robot,\nlead the\nway.",
                         constants.portraits.professor },
                       { "You must\nprotect us\nif there's\ndanger.",
                         constants.portraits.professor },
                       { "I'M BEING\nCONTROLLED.\nARE YOU\nCONTROLLED?",
                         constants.portraits.player },
                       { "No, of\ncourse not.",
                         constants.portraits.professor },
                       { "You\nridiculous\nrobot!",
                         constants.portraits.professor },
                       { "Go on,\nhurry.",
                         constants.portraits.professor }
                    },
                    goright = {
                       {"I command\nyou to go\nforward!",
                        constants.portraits.professor}
                    },

                   }

Caves.objectList.goright.k = 'any'

Caves.zList = { "bg",
                "assistant",
                "professor",
                "player",
                "convo01",
                "convo02",
                "convo03",
                "goright",
                "entryfader",
                "exitfader"}

Caves.staticList = {"bg",
                    "assistant",
                    "professor",
                    "player",
                    }

Caves.eventList = { "entryfader",
                    "convo01",
                    "wait01",
                    "convo02",
                    "move01",
                    "wait02",
                    "move02",
                    "move03",
                    "wait03",
                    "move04",
                    "convo03",
                    "move05",
}


-- special functions for player sprite
function Caves:customupdate(dt)

   -- if all the events in eventlist are done
   if self.currevent > #self.eventList then

      if not Caves.playthatmusicdammit then
         Caves.playthatmusicdammit = true
         love.audio.stop()
         love.audio.play(constants.music.robot)
      end

      if love.keyboard.isDown("right") then
         -- notice we are moving the background rather than the player
         self.objectList.bg:move(-1)
         self.objectList.professor:move(-1)
         self.objectList.assistant:move(-1)
      elseif love.keyboard.isDown("left") then
         -- we will only activate the yelling here. it musn't go in the event or static list.
         self.objectList.goright.active = true
      end

      if love.keyboard.isDown("up") and self.objectList.player.y >= 67 then
         self.objectList.player:move(nil,-1)
      elseif love.keyboard.isDown("down") and self.objectList.player.y <= 74 then
         self.objectList.player:move(nil,1)
      end

      if self.objectList.player.x > self.objectList.professor.x + 30 then
         self.objectList.professor:move(1)
         self.objectList.assistant:move(1)
      end

      if self.objectList.bg.x <= -360 then
         self.objectList.exitfader.active = true
      end

   end


end

return Caves
