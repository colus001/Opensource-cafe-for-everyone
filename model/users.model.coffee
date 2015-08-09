@Users = Meteor.users or new Mongo.Collection('users')

Users.attachSchema(new SimpleSchema
  _id: SCHEMA_HELPER.ID
  shortId: SCHEMA_HELPER.SHORT_ID
)
