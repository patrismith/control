local Splash = State:new()

Splash.music = constants.music.splash

Splash.objectList = { splashscreen = Sprite:new(),
                      logo = Sprite:new(),
                      pressspace = Text:new(),
                      -- move the logo down
                      move01 = Pause:new(),
                      -- a short pause
                      move02 = Pause:new(),
                      -- make text appear
                      move03 = Pause:new(),
                      startgame = Input:new(),
                      entryfader = Fader:new(),
                      exitfader = Fader:new(),
}

Splash.paramList = { splashscreen = { img = constants.bg.splash },
                     logo = { x = 5,
                              y = -82,
                              img = constants.bg.logo },
                     pressspace = { x = 30,
                                    y = -100,
                                    w = 100,
                                    align = "center",
                                    text = "PRESS SPACE\nTO \"PLAY\"" },
                     move01 = {f = function()
                                  Splash.objectList.logo:move(nil,0.25)
                                  end,
                              howlong = 360},
                     move02 = {howlong = 20},
                     move03 = {f = function()
                                  Splash.objectList.pressspace.y = 110
                                  end,
                              howlong = 1},
                     startgame = { k = " "},
                     entryfader = {coming = true},
                     exitfader = {state = "Lab"},

                   }

Splash.zList = { "splashscreen",
                 "logo",
                 "pressspace",
                 "entryfader",
                 "exitfader"}

Splash.staticList = { "splashscreen",
                      "logo",
                      "pressspace"}

Splash.eventList = { "entryfader",
                     "move01",
                     "move02",
                     "move03",
                     "startgame",
                     "exitfader"}


return Splash
