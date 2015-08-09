@Boards = new Mongo.Collection('boards')

Boards.attachSchema(new SimpleSchema(
  _id: SCHEMA_HELPER.ID
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
    type: SimpleSchema.RegEx.Id
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
