'use strict'

angular.module('theCafeApp')
.directive('commentList', ($meteor) ->
  {
    restrict: 'E'
    templateUrl: 'client/common/commentList/comment-list.view.ng.html'
    replace: true
    link: (scope, elem, attrs) ->
      self = this
      scope.upvoted = (comment) ->
        _.contains(comment?.upvoters, Meteor.userId()) or false
      scope.downvoted = (comment) ->
        _.contains(comment?.downvoters, Meteor.userId()) or false
      scope.upvote = (comment) ->
        $meteor.call('upvoteComment', comment._id)
      scope.downvote = (comment) ->
        $meteor.call('downvoteComment', comment._id)
      scope.getMultilineText = (text) ->
        text.split('\n') if text
      scope.addComment = (comment, parent) ->
        return unless scope.commentForm.$valid
        _.extend(comment,
          topLevelCommentId: parent.topLevelCommentId or parent._id
          parentCommentId: parent._id
          postId: parent.postId
        )
        $meteor.call('createComment', comment)
        @newSubComment = undefined
  }
)
