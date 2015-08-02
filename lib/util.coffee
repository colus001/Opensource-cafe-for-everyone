@Util =
  slugify: (text, options) ->
    options = _.defaults(options or {},
      decode: true
    )
    return null unless text

    text = unidecode(text) if options.decode
    text.toLowerCase()
      .replace(/[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g, '') # Remove all punctuations
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
