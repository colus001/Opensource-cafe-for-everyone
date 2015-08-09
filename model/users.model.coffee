# @Users = Meteor.users or new Mongo.Collection('users')
#
# Users.attachSchema(new SimpleSchema(
#   createdAt:
#     type: Date
#     label: "Created At"
#     defaultValue: new Date()
#   updatedAt:
#     type: Date
#     label: "Updated At"
#     defaultValue: new Date()
#   profile:
#     type: ProfileSchema
#     optional: true
#   emails:
#     type: [EmailSchema]
#     optional: true
# ))
#
# ProfileSchema = new SimpleSchema(
#   "profile.shortId": SCHEMA_HELPER.SHORT_ID
# )
#
# EmailSchema = new SimpleSchema(
#   "emails.address":
#     type: String
#     regEx: SCHEMA_HELPER.EMAIL_REGEX
#   "emails.verified":
#     type: Boolean
# )
