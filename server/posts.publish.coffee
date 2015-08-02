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

Meteor.methods(
  'upvotePost': (postId) ->
    post = Posts.findOne(_id: postId)
    userId = this.userId

    isUpvoted = _.contains(post.upvoters, userId)
    isDownvoted = _.contains(post.downvoters, userId)
    upvotes = post.upvoters?.length or 0
    downvotes = post.downvoters?.length or 0

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

    # return console.log options

    Posts.update(post._id, options)

  'downvotePost': (postId) ->
    post = Posts.findOne(_id: postId)
    userId = this.userId

    isUpvoted = _.contains(post.upvoters, userId)
    isDownvoted = _.contains(post.downvoters, userId)
    upvotes = post.upvoters?.length or 0
    downvotes = post.downvoters?.length or 0

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

    Posts.update(post._id, options)
)
