'use strict'

Meteor.publish('getBoardBySymbol', (symbol) ->
  Boards.find(symbol: symbol)
)

Meteor.publish('getAllBoards', ->
  Boards.find({})
)

Meteor.methods(
  createBoard: (board) ->
    check(board, Object)
    _.extend(board,
      symbol: board.symbol?.toLowerCase() or Util.slugify(board.title)
      creatorId: Meteor.user().profile.shortId
      shortId: Util.makeShortId(SHORT_ID_LENGTH)
    )
    Boards.insert(board)
)
