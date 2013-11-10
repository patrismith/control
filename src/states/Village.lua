local Village = State:new()


Village.objectList = { bg = Sprite:new(),
                       scientist01 = Sprite:new(),
                       scientist02 = Sprite:new(),
                       scientist03 = Sprite:new(),
                       monster01 = Sprite:new(),
                       monster02 = Sprite:new(),
                       move01 = Pause:new(),
                       move02 = Pause:new(),
                       move03 = Pause:new(),
                       move04 = Pause:new(),
                       move05 = Pause:new(),
                       move06 = Pause:new(),
                       entryfader = Fader:new(),
                       exitfader = Fader:new(),

                     }

Village.paramList = { bg = { img = constants.bg.village },
                      entryfader = {coming = true},
                      exitfader = {state = "Caves"},
                      scientist01 = { x = 140,
                                      y = 40,
                                      flipped = true,
                                      img = constants.sprites.scientist02 },
                      scientist02 = { x = 100,
                                      y = 80,
                                      flipped = true,
                                      img = constants.sprites.scientist01 },
                      scientist03 = {x = 60,
                                     y = 60,
                                     flipped = true,
                                     img = constants.sprites.scientist02 },
                      monster01 = {x = 200,
                                   y = 20,
                                   flipped = true,
                                   img = constants.sprites.monster },
                      monster02 = {x = 250,
                                   y = 50,
                                   img = constants.sprites.monster },
                      move01 = { f = function()
                                    Village.objectList.scientist01:move(-0.5,0.25)
                                    Village.objectList.scientist02:move(-0.25)
                                    Village.objectList.scientist03:move(-0.35,-0.20)
                                    Village.objectList.monster01:move(-2)
                                    Village.objectList.monster02:move(-2)
                               end,
                               howlong = 40 },
                      move02 = { f = function()
                                    Village.objectList.scientist01:move(-0.5,0.25)
                                    Village.objectList.scientist02:move(-0.25)
                                    Village.objectList.scientist03:move(-0.35,-0.20)
                                    Village.objectList.monster01:move(-1,0.25)
                                    Village.objectList.monster02:move(-2,0.5)
                               end,
                               howlong = 34,
                               done = function()
                                  Village.objectList.monster02.origx = Village.objectList.monster02.x
                               end },
                      move03 = { f = function()
                                    Village.objectList.scientist01:die()
                                    Village.objectList.scientist02:move(-0.25)
                                    Village.objectList.scientist03:move(-0.35,-0.20)
                                    Village.objectList.monster01:move(-1,0.25)
                                    Village.objectList.monster02:explosion()
                               end,
                               howlong = 34,
                               done = function()
                                  Village.objectList.scientist01.visible = false
                               end },
                      move04 = { f = function()
                                    Village.objectList.scientist02:move(-0.5)
                                    Village.objectList.scientist03:move(-0.35,0.25)
                                    Village.objectList.monster01:move(-1,0.25)
                                    Village.objectList.monster02:move(-1,0.25)
                               end,
                               howlong = 40,
                               done = function()
                                  Village.objectList.monster01.origx = Village.objectList.monster01.x
                               end },
                      move05 = { f = function()
                                    Village.objectList.scientist02:move(-0.5)
                                    Village.objectList.scientist03:die(-0.35,0.25)
                                    Village.objectList.monster01:explosion()
                                    Village.objectList.monster02:move(-1,0.25)
                               end,
                               howlong = 15,
                               done = function()
                                  Village.objectList.monster02.origx = Village.objectList.monster02.x
                               end },
                      move06 = { f = function()
                                    Village.objectList.scientist02:die()
                                    Village.objectList.scientist03:die()
                                    Village.objectList.monster01:explosion()
                                    Village.objectList.monster02:explosion()
                               end,
                               howlong = 50 },



                    }

Village.zList = { "bg",
                  "scientist01",
                  "scientist02",
                  "scientist03",
                  "monster01",
                  "monster02",
                  "entryfader",
                  "exitfader"}

Village.staticList = { "bg",
                       "scientist01",
                       "scientist02",
                       "scientist03",
                       "monster01",
                       "monster02"}

Village.eventList = { "entryfader",
                      "move01",
                      "move02",
                      "move03",
                      "move04",
                      "move05",
                      "move06",
                      "exitfader"
}


return Village
