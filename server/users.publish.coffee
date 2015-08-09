Accounts.onCreateUser((options, user) ->
  user.shortId = Util.makeShortId(SHORT_ID_LENGTH)
  console.log user
  user
)
