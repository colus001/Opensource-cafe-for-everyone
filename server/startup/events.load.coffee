Meteor.startup ->
  if Events.find().count() == 0
    events = [
      {
        'name': 'event 1'
      }
      {
        'name': 'event 2'
      }
    ]
    events.forEach (event) ->
      Events.insert event