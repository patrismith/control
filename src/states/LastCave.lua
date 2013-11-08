local Splash = State:new()


Splash.objectList = { splashscreen = Sprite:new(),
                      pressanykey = Input:new()}

Splash.paramList = { splashscreen = { img = constants.bg.test},
                     pressanykey = { f = function() statemanager.nextState("Lab") end }
                   }

Splash.zList = { "splashscreen" }

Splash.staticList = {"splashscreen"}

Splash.eventList = { "pressanykey" }


return Splash
