'use strict'

angular.module 'theCafeApp'
.directive 'commentList', [() ->
  {
    restrict: 'E'
    templateUrl: 'client/common/commentList/comment-list.view.ng.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.upvoted = (comment) ->
        _.contains(comment?.upvoters, Meteor.userId()) or false
      scope.downvoted = (comment) ->
        _.contains(comment?.downvoters, Meteor.userId()) or false
      scope.upvote = (comment) ->
        $meteor.call('upvoteComment', comment._id)
      scope.downvote = (comment) ->
        $meteor.call('downvoteComment', comment._id)
      scope.getMultilineText = (text) ->
        text.split('\n')
      scope.addComment = (comment, parent) ->
        return unless scope.commentForm.$valid
        root = _findPostId(parent)
        _.extend(scope.newComment,
          # topLevelCommentId: comment._id
          parentCommentId: comment._id
          postId: comment.postId
        )
        $meteor.call('createComment', scope.newComment)
        scope.newComment = undefined
  }
]
