Accounts.onCreateUser((options, user) ->
  # profile =
  #   shortId: Util.makeShortId(TB.SHORT_ID_LENGTH),
  #   firstName: Util.deep(user, 'services.twitter.screenName') or Util.deep(user, 'services.facebook.first_name')
  #   lastName: Util.deep(user, 'services.facebook.last_name')
  # user.profile = _.extend(_.clone(options?.profile or {}), profile)
  # if options.email and not Users.findOne('emails.address': options.email)
  #   _addEmailOnSlackMailchimp(options.email)
  # else if user.services?.facebook and not Users.findOne('services.facebook.email': user.services.facebook.email)
  #   _addEmailOnSlackMailchimp(user.services.facebook.email, feedback: true)
  # user


  user.shortId = Util.makeShortId(6)
  user
)
