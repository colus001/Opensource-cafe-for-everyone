Accounts.onCreateUser((options, user) ->
  profile =
    shortId: Util.makeShortId(SHORT_ID_LENGTH)
  user.profile = _.extend(_.clone(options?.profile or {}), profile)
  user
)
