'use strict'

Meteor.publish('posts', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish(this, 'numberOfPosts', Posts.find(
    'title':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true)
  Posts.find({
    'boardId':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)
