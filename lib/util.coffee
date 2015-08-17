@Util =
  slugify: (text, options) ->
    options = _.defaults(options or {},
      decode: true
    )
    return null unless text

    text = unidecode(text) if options.decode and unidecode?
    text.toLowerCase()
      .replace(/[\?\.,-\/#!$%\^&\*;:{}=\-_`~()]/g, '') # Remove all punctuations
      .replace(/\s+/g, '-')       # Replace spaces with -
      .replace(/\-\-+/g, '-')     # Replace multiple - with single -
      .replace(/^-+/, '')         # Trim - from start of text
      .replace(/-+$/, '')

  makeShortId: (len) ->
    (new Meteor.Collection.ObjectID())._str.substring(0, len)

  urlify: (text) ->
    text = "http://" + text if !/^(f|ht)tps?:\/\//i.test(text)
    text

  sum: (xs, f) ->
    _.reduce(xs, ((memo, x) -> memo + f(x)), 0)

  getCommentTree: (comments) ->
    {parents, children} =
      _.chain(comments)
        .sortBy((comment) -> -comment.createdAt)
        .sortBy((comment) -> -comment.score)
        .groupBy((comment) -> if not _.has(comment, "parentCommentId") then "parents" else "children")
        .value()

    _.each(parents, (parent) => @findChildren(parent, children))
    parents

  findChildren: (parent, comments) ->
    children = _.where(comments, parentCommentId: parent._id)
    return unless children
    _.each(parent.comments = children, (comment) => @findChildren(comment, comments))
