@Comments = new Mongo.Collection('comments')

Comments.allow(
  insert: (userId, comment) ->
    comment.createdBy = Meteor.user().shortId
    true
  update: (userId, comment, fields, modifier) ->
    true
  remove: (userId, comment) ->
    true
)
