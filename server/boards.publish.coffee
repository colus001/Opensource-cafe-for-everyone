'use strict'

Meteor.publish 'boards', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfBoards', Boards.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Boards.find {
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
