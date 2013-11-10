local Lab = State:new()

Lab.music = constants.music.lab

Lab.objectList = { bg = Sprite:new(),
                   professor = Sprite:new(),
                   assistant = Sprite:new(),
                   convo01 = DialogueBoxSeries:new(),
                   convo02 = DialogueBoxSeries:new(),
                   -- assistant comes onscreen
                   move01 = Pause:new(),
                   -- assistant and professor move offscreen
                   move02 = Pause:new(),
                   -- background shakes
                   explosion = Pause:new(),
                   entryfader = Fader:new(),
                   exitfader = Fader:new(),

                   }

Lab.paramList = { bg = { x = 0, img = constants.bg.lab },
                  entryfader = {coming = true},
                  exitfader = {state="Village"},
                  professor = { x = 100,
                                y = 60,
                                img = constants.sprites.professor },
                  assistant = { x = -30,
                                y = 60,
                                img = constants.sprites.assistant },
                  move01 = { f = function()
                                Lab.objectList.assistant:move(1)
                                end,
                             howlong = 60 },
                  move02 = { f = function()
                                if not Lab.objectList.assistant.flipped then Lab.objectList.assistant.flipped = true end
                                if not Lab.objectList.professor.flipped then Lab.objectList.professor.flipped = true end
                                Lab.objectList.assistant:move(-1)
                                Lab.objectList.professor:move(-3)
                                end,
                             howlong = 100,
                           --  done = function()
                             --   statemanager.nextState("Village") end
                           },
                  explosion = {f = function()
                                  -- argh
                                  if not Lab.playingexplosionsound then
                                     Lab.playingexplosionsound = true
                                     love.audio.stop()
                                     love.audio.play(constants.music.explosion)
                                  end
                                  -- this function was coded before implementing 'done'
                                  -- should change it...
                                  Lab.explosioncounter = Lab.explosioncounter and Lab.explosioncounter + 1 or 0
                                  if Lab.explosioncounter < 50 then
                                     Lab.objectList.bg.explosion(Lab.objectList.bg)
                                  else
                                     Lab.objectList.bg.x = 0
                                  end end,
                               howlong = 120,
                               done = function()
                                  love.audio.stop()
                                  love.audio.play(constants.music.escape)
                              end },
                  convo01 = {
                     { "Professor\nRicki! Jim\nwas found\ndead,",
                       constants.portraits.assistant },
                     { "outside\nthe troll\ncages!",
                       constants.portraits.assistant },
                     { "...",
                       constants.portraits.professor },
                     { "There was a\nnote found\nwith his\nbody,",
                       constants.portraits.assistant },
                     { "written in a\nstrangely\nmechanical\nhand:",
                       constants.portraits.assistant },
                     { '"WILL I EVER\nGET TO PLAY\nTHE GAME?"',
                       constants.portraits.assistant },
                     { "What does it\nmean?",
                       constants.portraits.assistant },
                     { "It's\nbegun...",
                       constants.portraits.professor }
                  },
                convo02 = {
                   { "Watch out!\nIt's a bomb!",
                     constants.portraits.professor },
                   { "WARNING!\nWARNING!",
                     constants.portraits.loudspeaker },
                   { "THE TROLLS\nHAVE\nESCAPED!",
                     constants.portraits.loudspeaker },
                   { "Oh no!",
                     constants.portraits.assistant },
                   { "Our only\nchance is\nthrough the\ncaves. Run!",
                     constants.portraits.professor }
                }
                }

Lab.zList = { "bg",
              "professor",
              "assistant",
              "convo01",
              "convo02",
              "entryfader",
              "exitfader"}

Lab.staticList = { "bg",
                   "professor",
                   "assistant"}

Lab.eventList = { "entryfader",
                  "move01",
                  "convo01",
                  "explosion",
                  "convo02",
                  "move02",
                  "exitfader"}


return Lab
