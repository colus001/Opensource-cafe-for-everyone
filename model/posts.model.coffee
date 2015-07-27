@Posts = new Mongo.Collection('posts')

Posts.allow(
  insert: (userId, post) ->
    post.ownerId = Meteor.user().shortId
    post.boardId = Boards.findOne(symbol: post.board)._id
    post.slug = Util.slugify(post.title, decode: false) unless post.slug
    post.shortId = Util.makeShortId(6)
    true
  update: (userId, post, fields, modifier) ->
    true
  remove: (userId, post) ->
    true
)
