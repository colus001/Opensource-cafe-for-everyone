'use strict'

angular.module('theCafeApp')
.directive('commentListItem', ($meteor) ->
  restrict: 'E'
  templateUrl: 'client/common/commentListItem/comment-list-item.view.ng.html'
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
)
