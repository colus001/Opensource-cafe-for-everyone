@Posts = new Mongo.Collection('posts')

Posts.attachSchema(new SimpleSchema(
  shortId: SCHEMA_HELPER.SHORT_ID
  createdAt:
    type: Date
    label: "Created At"
    defaultValue: new Date()
  updatedAt:
    type: Date
    label: "Updated At"
    defaultValue: new Date()
  board:
    type: String
    label: "Board"
  authorId:
    type: SimpleSchema.RegEx.Id
    label: "Author ID"
  author:
    type: String
    label: "Author"

  title:
    type: String
    label: "Title"
  link:
    type: String
    label: "Link"
    optional: true
  text:
    type: String
    label: "Text"
    optional: true
  slug:
    type: String
    label: "Slug"
  score:
    type: Number
    label: "Score"
    defaultValue: 0
  comments:
    type: Number
    label: "Number of Comments"
    defaultValue: 0
  upvotes:
    type: Number
    label: "Upvotes"
    defaultValue: 0
  upvoters:
    type: [SimpleSchema.RegEx.Id]
    label: "Upvoters"
    defaultValue: []
  downvotes:
    type: Number
    label: "Downvotes"
    defaultValue: 0
  downvoters:
    type: [SimpleSchema.RegEx.Id]
    label: "Downvoters"
    defaultValue: []
))
