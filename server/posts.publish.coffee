'use strict'

_getAuthorName = (user) ->
  user.profile?.name or user.emails[0].address.split('@')[0]

Meteor.publish('getPostBySlug', (slug) ->
  Posts.find(slug: slug)
)

Meteor.publish('getPostsByBoardSymbol', (symbol) ->
  Posts.find(board: symbol)
)

Meteor.publish('getPopularPosts', ->
  Posts.find()
)

Meteor.methods(
  'createPost': (post) ->
    check(post, Object)
    _.extend(post,
      createdAt: new Date()
      authorId: Meteor.user().shortId
      author: _getAuthorName(Meteor.user())
      boardId: Boards.findOne(symbol: post.board)._id
      slug: Util.slugify(post.title, decode: false) unless post.slug
      link: Util.urlify(post.link) if post.link
      shortId: Util.makeShortId(SHORT_ID_LENGTH)
      score: 0
      upvotes: 0
      downvotes: 0
    )
    return throw new Meteor.Error('text or link is required') if not post.text and not post.link
    console.log post
    Posts.insert(post)

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
