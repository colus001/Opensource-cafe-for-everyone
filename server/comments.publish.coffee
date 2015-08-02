'use strict'

Meteor.publish('comments', (options, searchString) ->
  searchString = '' if !searchString

  Comments.find({
    'postId':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)
