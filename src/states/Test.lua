local Test = State:new()


Test.objectList = { testbg = Sprite:new(),
                      professor = Sprite:new(),
                      testconvo = DialogueBoxSeries:new(),
                      nextconvo = DialogueBoxSeries:new()}

Test.paramList = { testbg = { img = 'assets/testbg.png'},
                     professor = { x = 144,
                                   y = 128,
                                   img = 'assets/professor-sprite.png'},
                     testconvo = {{" ABCDEFGHIJKLMNOPQRSTUVWXYZ",constants.portraits.professor},
                                  {"This is another line of dialogue.",constants.portraits.professor},
                                  {"The third and last line. \"Whew\"",constants.portraits.professor}},
                     nextconvo = {{"This is the next person speaking.",constants.portraits.assistant}},
                   }

Test.zList = { "testbg",
                 "professor",
                 "testconvo",
                 "nextconvo"}

Test.staticList = {"testbg",
                     "professor"}

Test.eventList = { "testconvo",
                     "nextconvo" }


return Test
