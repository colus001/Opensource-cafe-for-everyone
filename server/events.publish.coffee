'use strict'

Meteor.publish('events', ->
  Events.find()
)
