'use strict'

Meteor.publish('getCommentByPostId', (id) ->
  Comments.find(postId: id)
)

Meteor.publish('getCommentsByCommentId', (id) ->
  Comments.find(parentCommentId: id)
)

_updateNumberOfComment = (comment) ->
  Posts.update(comment.postId, $set: { comments: Comments.find(postId: comment.postId).count() })

Meteor.methods(
  createComment: (comment) ->
    check(comment, Object)
    user = Meteor.user()
    _.extend(comment,
      authorId: user.profile.shortId
      author: user.name or user.emails[0].address
      shortId: Util.makeShortId(SHORT_ID_LENGTH)
    )
    Comments.insert(comment)
    _updateNumberOfComment(comment)

  upvoteComment: (commentId) ->
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

  downvoteComment: (commentId) ->
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
