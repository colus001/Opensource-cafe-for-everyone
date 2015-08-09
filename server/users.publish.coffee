Accounts.onCreateUser((options, user) ->
  _.extend(user,
    shortId: Util.makeShortId(SHORT_ID_LENGTH)
  )
  user
)
