@Boards = new Mongo.Collection('boards')

Boards.attachSchema(new SimpleSchema(
  shortId: SCHEMA_HELPER.SHORT_ID
  createdAt:
    label: "Created At"
    type: Date
    defaultValue: new Date()
  updatedAt:
    label: "Updated At"
    type: Date
    defaultValue: new Date()
  creatorId:
    label: "Creator User ID"
    type: SCHEMA_HELPER.SHORT_ID.type
  title:
    label: "Title"
    type: String
  symbol:
    label: "Symbol"
    type: String
  description:
    label: "Description"
    type: String
))
