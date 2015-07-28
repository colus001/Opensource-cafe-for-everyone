'use strict'

Meteor.publish('comments', (options, searchString) ->
  searchString = '' if !searchString

  Counts.publish(this, 'numberOfBoards', Comments.find(
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true)

  Comments.find({
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)
