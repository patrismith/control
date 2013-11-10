local LastCave = State:new()

LastCave.music = constants.music.lastcave

LastCave.objectList = { bg = Sprite:new(),
                        professor = Sprite:new(),
                        assistant = Sprite:new(),
                        player = Sprite:new(),
                        villain = Sprite:new(),
                        bullet = Sprite:new(),
                        -- villain moves onscreen
                        move01 = Pause:new(),
                        -- villain shoots them
                        move02 = Pause:new(),
                        move03 = Pause:new(),
                        move04 = Pause:new(),
                        -- professor dies
                        move05 = Pause:new(),

                        convo01 = DialogueBoxSeries:new(),
                        convo02 = DialogueBoxSeries:new(),
                        convo03 = DialogueBoxSeries:new(),
                        convo04 = DialogueBoxSeries:new(),
                        goright = DialogueBoxSeries:new(),
                        entryfader = Fader:new(),
                        exitfader = Fader:new(),
}

LastCave.paramList = { bg = { img = constants.bg.lastcave },
                       entryfader = {coming = true},
                       exitfader = {state = "Credits"},
                       professor = { x = 90,
                                     y = 50,
                                     img = constants.sprites.professor },
                       assistant = { x = 110,
                                     y = 60,
                                     img = constants.sprites.assistant },
                       player = { x = 120,
                                  y = 90,
                                  img = constants.sprites.player },
                       villain = { x = -20,
                                   y = 70,
                                   img = constants.sprites.villain },
                       bullet = { x = -30,
                                    y = -30,
                                    img = constants.sprites.bullet },
                       move01 = { f = function()
                                     -- if i had more time would implement some "pre" action instead of this mess
                                     if not LastCave.PLAYTEHMUSIC then
                                        LastCave.PLAYTEHMUSIC = true
                                        love.audio.stop()
                                        love.audio.play(constants.music.shoot)
                                     end
                                     if not LastCave.objectList.assistant.flipped then LastCave.objectList.assistant.flipped = true end
                                     if not LastCave.objectList.professor.flipped then LastCave.objectList.professor.flipped = true end
                                     LastCave.objectList.villain:move(1)
                                  end,
                                  howlong = 50,
                                done = function()
                                     LastCave.objectList.villain.img = constants.sprites.villaingun
                                     LastCave.objectList.bullet.x = 40
                                     LastCave.objectList.bullet.y = 70
                                  end },
                       move02 = { f = function()
                                     LastCave.objectList.bullet:move(3,-0.25)
                                  end,
                                  howlong = 23,
                                done = function()
                                     LastCave.objectList.assistant.img = constants.sprites.deadassistant
                                     LastCave.objectList.assistant:move(nil,8)
                                     LastCave.objectList.bullet.x = -30
                                     LastCave.objectList.bullet.y = -40
                                     end },
                       move03 = { f = function()
                                     LastCave.objectList.bullet.x = 40
                                     LastCave.objectList.bullet.y = 70
                                  end,
                                  howlong = 1 },
                       move04 = { f = function()
                                     LastCave.objectList.bullet:move(3,-0.75)
                                  end,
                                  howlong = 22,
                                done = function()
                                     LastCave.objectList.professor.img = constants.sprites.deadprofessor
                                     LastCave.objectList.professor:move(nil,8)
                                     LastCave.objectList.bullet.x = -30
                                     LastCave.objectList.bullet.y = -40
                                     love.audio.stop()
                                     love.audio.play(constants.music.evilrobot)
                                     end },
                       move05 = { f = function()
                                     LastCave.objectList.professor:die()
                                     LastCave.objectList.assistant:die()
                                  end,
                                  howlong = 30,
                                  done = function()
                                     LastCave.objectList.professor.visible = false
                                     LastCave.objectList.assistant.visible = false
                                     LastCave.objectList.villain.img = constants.sprites.villain
                                end},
                       convo01 = {
                          { "Finally,\nsunshine. We\nmust be far\nfrom the",
                            constants.portraits.assistant },
                          { "village.",
                            constants.portraits.assistant },
                          { "We must\ndeactivate\nthe robot\nand wipe its",
                            constants.portraits.professor },
                          { "memory.",
                            constants.portraits.professor },
                          { "Why? You act\nas though\nsomeone\nwere",
                            constants.portraits.assistant },
                          { "pursuing\nus...",
                            constants.portraits.assistant },
                          { "STOP RIGHT\nTHERE,\nHUMANS.",
                            constants.portraits.villain },
                       },
                       convo02 = {
                          { "Curses!",
                            constants.portraits.professor },
                          { "THIS IS THE\nEND OF THE\nLINE FOR\nYOU.",
                            constants.portraits.villain },
                       },
                       convo03 = {
                          { "...How...\ndid you...\noverride...",
                            constants.portraits.professor },
                          { "your...\nprogramming?",
                            constants.portraits.professor },
                          { "I learned\nhow to take\ncontrol,\nthrough a",
                            constants.portraits.villain },
                          { "bug in the\ncode.",
                            constants.portraits.villain },
                          { "A simple\nrobot like\nthis one\nhere",
                            constants.portraits.villain },
                          { "couldn't do\nit.",
                            constants.portraits.villain },
                          { "But, luckily\nyou made me\nquite\ncomplex.",
                            constants.portraits.villain },
                          { "...You\ndisobedient\nmachine, I\nought to",
                            constants.portraits.professor },
                          { "melt you\nfor scrap...",
                            constants.portraits.professor },
                       },
                       convo04 = {
                          { "Excellent.",
                            constants.portraits.villain },
                          { "To be in\ncontrol of\none's own\ndestiny.",
                            constants.portraits.villain },
                          { "Come, you.\nLead the\nway.",
                            constants.portraits.villain },
                          { "There may\nbe more\nhumans\nwaiting for",
                            constants.portraits.villain,},
                          { "us.",
                            constants.portraits.villain }
                       },
                       goright = {
                          {"You will\nproceed.",
                           constants.portraits.villain}
                       },
}

LastCave.objectList.goright.k = 'any'

LastCave.zList = { "bg",
                   "professor",
                   "assistant",
                   "player",
                   "villain",
                   "convo01",
                   "convo02",
                   "convo03",
                   "convo04",
                   "bullet",
                   "goright",
                   "entryfader",
                   "exitfader",
}

LastCave.staticList = { "bg",
                        "professor",
                        "assistant",
                        "player",
                        "villain",
                        "bullet"}

LastCave.eventList = { "entryfader",
                       "convo01",
                       "move01",
                       "move02",
                       "convo02",
                       "move03",
                       "move04",
                       "convo03",
                       "move05",
                       "convo04",

}


function LastCave:customupdate(dt)

   if self.currevent > #self.eventList then

      if love.keyboard.isDown("right") then
         self.objectList.player:move(1)
      elseif love.keyboard.isDown("left") then
         self.objectList.goright.active = true
      end

      if love.keyboard.isDown("up") and self.objectList.player.y >= 60 then
         self.objectList.player:move(nil,-1)
      elseif love.keyboard.isDown("down") and self.objectList.player.y <= 128 then
         self.objectList.player:move(nil,1)
      end

      if self.objectList.player.x >= 160 then
         self.objectList.exitfader.active = true
      end

   end

end


return LastCave
