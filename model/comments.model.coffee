@Comments = new Mongo.Collection('comments')

Comments.allow(
  insert: (userId, comment) ->
    user = Meteor.user()
    comment.createdBy = user.shortId
    comment.createdAt = new Date()
    comment.author = user.name or user.emails[0].address
    true
  update: (userId, comment, fields, modifier) ->
    true
  remove: (userId, comment) ->
    true
)
