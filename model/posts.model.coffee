@Posts = new Mongo.Collection('posts')

Posts.allow(
  insert: (userId, post) ->
    post.createdAt = new Date()
    post.ownerId = Meteor.user().shortId
    post.boardId = Boards.findOne(symbol: post.board)._id
    post.slug = Util.slugify(post.title, decode: false) unless post.slug
    post.link = Util.urlify(post.link) if post.link
    post.shortId = Util.makeShortId(6)
    true
  update: (userId, post, fields, modifier) ->
    true
  remove: (userId, post) ->
    true
)
