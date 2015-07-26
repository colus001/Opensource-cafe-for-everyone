@Posts = new Mongo.Collection('posts')

Posts.allow
  insert: (userId, post) ->
    post.ownerId = Meteor.userId()
    true
  update: (userId, post, fields, modifier) ->
    true
  remove: (userId, post) ->
    true
