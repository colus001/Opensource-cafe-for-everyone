'use strict'

Meteor.publish('boards', (options, searchString) ->
  searchString = '' if !searchString

  Counts.publish(this, 'numberOfBoards', Boards.find(
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true)

  Boards.find({
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)
