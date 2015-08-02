'use strict'

Meteor.publish('comments', (options, searchString) ->
  searchString = '' if !searchString

  Comments.find({
    'postId':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options)
)


Meteor.methods(
  'upvoteComment': (commentId) ->
    comment = Comments.findOne(_id: commentId)
    userId = this.userId

    isUpvoted = _.contains(comment.upvoters, userId)
    isDownvoted = _.contains(comment.downvoters, userId)
    upvotes = comment.upvoters?.length or 0
    downvotes = comment.downvoters?.length or 0

    if isUpvoted
      options =
        $set: { upvotes: --upvotes }
        $pop: { upvoters: userId }
    else
      options =
        $set: { upvotes: ++upvotes }
        $push: { upvoters: userId }

      if isDownvoted
        _.extend(options.$set, downvotes: --downvotes)
        _.extend(options, $pop: { downvoters: userId })

    _.extend(options.$set, score: upvotes - downvotes)

    Comments.update(comment._id, options)

  'downvoteComment': (commentId) ->
    comment = Comments.findOne(_id: commentId)
    userId = this.userId

    isUpvoted = _.contains(comment.upvoters, userId)
    isDownvoted = _.contains(comment.downvoters, userId)
    upvotes = comment.upvoters?.length or 0
    downvotes = comment.downvoters?.length or 0

    if isDownvoted
      options =
        $set: { downvotes: --downvotes }
        $pop: { downvoters: userId }
    else
      options =
        $set: { downvotes: ++downvotes }
        $push: { downvoters: userId }

      if isUpvoted
        _.extend(options.$set, upvotes: --upvotes)
        _.extend(options, $pop: { upvoters: userId })

    _.extend(options.$set, score: upvotes - downvotes)

    Comments.update(comment._id, options)
)
