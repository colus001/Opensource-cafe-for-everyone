'use strict'

Meteor.publish 'posts', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfPosts', Posts.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Posts.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options