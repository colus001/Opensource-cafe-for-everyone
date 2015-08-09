'use strict'

Meteor.publish('getBoardBySymbol', (symbol) ->
  Boards.find(symbol: symbol)
)

Meteor.publish('getAllBoards', ->
  Boards.find()
)

Meteor.methods(
  createBoard: (board) ->
    check(board, Object)
    _extend(board,
      shortId: Util.makeShortId(SHORT_ID_LENGTH)
    )
    Boards.insert(board)
)
