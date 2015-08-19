'use strict'

Meteor.publish('events',(options, searchString) ->
  searchString = '' if !searchString
  Counts.publish(this, 'numberOfEvents', Events.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true)
  Events.find({
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)
