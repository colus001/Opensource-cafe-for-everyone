@Users = Meteor.users or new Mongo.Collection('users')

Users.attachSchema(new SimpleSchema
  shortId: SCHEMA_HELPER.SHORT_ID
)
