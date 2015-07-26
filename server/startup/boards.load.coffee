Meteor.startup(->
  return unless Boards.find().count() is 0
  boards = [
    {
      'title': 'Free'
      'description': '자유게시판'
    }
    {
      'title': 'Hi'
      'description': '가입인사'
    }
  ]
  _.each(boards, (board) -> Boards.insert(board))
)
