local statemanager = {}

function statemanager.nextState(state)
   statemanager:change(state)
end

function statemanager:change(state)
   self.currentstate = state
   self.states[self.currentstate]:load()
end


function statemanager:update(dt)
   self.states[self.currentstate]:update(dt)
end


function statemanager:draw()
   self.states[self.currentstate]:draw()
end


function statemanager:keypressed(key)
   self.states[self.currentstate]:keypressed(key)
end


function statemanager:init()
   self.states = {Splash = require('states.Splash'),
                  Lab = require('states.Lab'),
                  Village = require('states.Village'),
                  Caves = require('states.Caves'),
                  GameOver = require('states.GameOver'),
                  Test = require('states.Test'),
                  LastCave = require('states.LastCave'),
                  Credits = require('states.Credits'),
                 }
   self:change("Splash") -- state to start with
end


return statemanager
