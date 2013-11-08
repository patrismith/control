local Splash = State:new()


Splash.objectList = { splashscreen = Sprite:new(),
                      startgame = Input:new()}

Splash.paramList = { splashscreen = { img = constants.bg.test},
                     startgame = { f = function() statemanager.nextState("Lab") end,
                                   k = " "}
                   }

Splash.zList = { "splashscreen" }

Splash.staticList = { "splashscreen" }

Splash.eventList = { "startgame" }


return Splash
