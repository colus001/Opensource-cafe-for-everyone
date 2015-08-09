'use strict'

Meteor.publish('getBoardBySymbol', (symbol) ->
  Boards.find(symbol: symbol)
)

Meteor.publish('getAllBoards', ->
  Boards.find()
)

# Meteor.publish('boards', (options, searchString) ->
#   searchString = '' if !searchString
#
#   Counts.publish(this, 'numberOfBoards', Boards.find(
#     'title':
#       '$regex': '.*' + searchString or '' + '.*'
#       '$options': 'i'
#   ), noReady: true)
#
#   Boards.find({
#     'symbol':
#       '$regex': '.*' + searchString or '' + '.*'
#       '$options': 'i'
#   }, options)
# )
