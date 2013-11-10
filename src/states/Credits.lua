local Credits = State:new()

Credits.music = constants.music.credits

Credits.objectList = { theend = Text:new(),
                       wait = Pause:new(),
                       scroll01 = Pause:new(),
                       scroll02 = Pause:new(),
                       scroll03 = Pause:new(),
                       scroll04 = Pause:new(),}
-- make scrollings add up to 7000

Credits.paramList = { wait = { howlong = 100 },
                      scroll01 = { f = function()
                                    Credits.objectList.theend:move(nil,-0.25)
                                    end,
                                 howlong = 2500,
                                 done = function()
                                    love.audio.stop()
                                    love.audio.rewind(constants.music.lab)
                                    love.audio.play(constants.music.lab)
                                 end },
                      scroll02 = { f = function()
                                      Credits.objectList.theend:move(nil,-0.25)
                                      end,
                                   howlong = 2000,
                                   done = function()
                                    love.audio.stop()
                                    love.audio.rewind(constants.music.evilrobot)
                                    love.audio.play(constants.music.evilrobot)
                                 end },
                      scroll03 = { f = function()
                                      Credits.objectList.theend:move(nil,-0.25)
                                      end,
                                   howlong = 2000,
                                   done = function()
                                    love.audio.stop()
                                    love.audio.rewind(constants.music.robot)
                                    love.audio.play(constants.music.robot)
                                 end },
                      scroll04 = { f = function()
                                      Credits.objectList.theend:move(nil,-0.25)
                                      end,
                                   howlong = 500 },
                      theend = { x = 0,
                                 y = 70,
                                 w = 160,
                                 color = constants.colors[4],
                                 credits = true,
                                 align = "center",
                                 text =
                                    "THE END?\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
                                    "Director\n\n" ..
                                    "P. Smith\n\n\n\n\n\n" ..
                                    "Producer\n\n" ..
                                    "Mary Harron\n\n\n\n\n\n" ..
                                    "Associate Producer\n\n" ..
                                    "Suzanne Schiffman\n\n\n\n\n\n" ..
                                    "Executive Producer\n\n" ..
                                    "Aaron Freeman\n\n\n\n\n\n" ..
                                    "Associate Executive Producer\n\n" ..
                                    "Agnes Varda\n\n\n\n\n\n" ..
                                    "Director of Production\n\n" ..
                                    "Jean Godard\n\n\n\n\n\n" ..
                                    "Direction Supervisor\n\n" ..
                                    "Akira Kurosawa\n\n\n\n\n\n" ..
                                    "Assistant Direction Supervisor\n\n" ..
                                    "Francis Ford Coppola\n\n\n\n\n\n" ..
                                    "Art Direction\n\n" ..
                                    "Naoko Takeuchi\n\n\n\n\n\n" ..
                                    "Composer\n\n" ..
                                    "Scott Duda\n\n\n\n\n\n" ..
                                    "Casting Director\n\n" ..
                                    "Patsy Smith\n\n\n\n\n\n" ..
                                    "Marketing Director\n\n" ..
                                    "Jane Wyman\n\n\n\n\n\n" ..
                                    "Chief Advisor\n\n" ..
                                    "S. M. Duda\n\n\n\n\n\n\n\n" ..
                                    "Cast\n\n\n" ..
                                    "Professor Ricki\n\n" ..
                                    "Kevin Costner\n\n\n\n\n\n" ..
                                    "Assistant Scientist\n\n" ..
                                    "R. Stevie Moore\n\n\n\n\n\n" ..
                                    "Trolls\n\n" ..
                                    "Douglas Sirk\n" ..
                                    "P. A. Smith\n\n\n\n\n\n" ..
                                    "Scientists\n\n" ..
                                    "S. Duda\n" ..
                                    "Douglas Sirk\n\n\n\n\n\n" ..
                                    "Villain\n\n" ..
                                    "Aileen Pringle\n\n\n\n\n\n" ..
                                    "Player\n\n" ..
                                    "You\n\n\n\n\n\n\n\n\n\n" ..
                                    "Creative Consultant\n\n" ..
                                    "Michael Melchiondo\n\n\n\n\n\n" ..
                                    "Storyboarding\n\n" ..
                                    "M. Night Shamalayan\n\n\n\n\n\n" ..
                                    "Boom Operator\n\n" ..
                                    "Nick Cave\n\n\n\n\n\n" ..
                                    "Assistant Boom Operator\n\n" ..
                                    "S. Spielberg\n\n\n\n\n\n\n\n\n\n\n\n" ..
                                    "Game Processing By LOVE3D\n\n" ..
                                    "Audio Posted On beepbox.co\n\n" ..
                                    "Visual Effects Edited On Krita\n\n\n\n\n\n" ..
                                    "All characters and credits in this work are fictitious. Any resemblance to real persons or credits is purely coincidental.\n\n\n\n\n\n\n\n\n\n\n\n" ..
                                    "Thank you for playing"

},
                    }

Credits.zList = { "theend" }

Credits.staticList = { "theend" }

Credits.eventList = { "wait",
                      "scroll01",
                      "scroll02",
                      "scroll03",
                      "scroll04"}


return Credits
