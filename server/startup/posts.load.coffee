Meteor.startup ->
  if Posts.find().count() == 0
    posts = [
      {
        'name': 'post 1'
      }
      {
        'name': 'post 2'
      }
    ]
    posts.forEach (post) ->
      Posts.insert post