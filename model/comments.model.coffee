@Comments = new Mongo.Collection('comments')

Comments.attachSchema(new SimpleSchema(
  shortId: SCHEMA_HELPER.SHORT_ID
  createdAt:
    type: Date
    label: "Created At"
    defaultValue: new Date()
  updatedAt:
    type: Date
    label: "Updated At"
    defaultValue: new Date()
  authorId:
    type: SimpleSchema.RegEx.Id
    label: "Author ID"
  author:
    type: String
    label: "Author"
  body:
    type: String
    label: "Comment Body"

  score:
    type: Number
    label: "Score"
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

  postId:
    type: SimpleSchema.RegEx.Id
    label: "Post ID"
  topLevelCommentId:
    type: SimpleSchema.RegEx.Id
    label: "Top Lavel Comment ID"
    optional: true
  parentCommentId:
    type: SimpleSchema.RegEx.Id
    label: "Parent Comment ID"
    optional: true
))
