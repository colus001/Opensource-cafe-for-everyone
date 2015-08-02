'use strict'

angular.module('theCafeApp')
.directive('postListItem', ($meteor) ->
  restrict: 'E'
  templateUrl: 'client/common/postListItem/post-list-item.view.ng.html'
  replace: true
  link: (scope, elem, attrs) ->
    scope.upvoted = (target) ->
      _.contains(target?.upvoters, Meteor.userId()) or false
    scope.downvoted = (target) ->
      _.contains(target?.downvoters, Meteor.userId()) or false
    scope.upvote = (comment) ->
      if comment
        $meteor.call('upvoteComment', comment._id)
      else
        $meteor.call('upvotePost', scope.post._id)
    scope.downvote = (comment) ->
      if comment
        $meteor.call('downvoteComment', comment._id)
      else
        $meteor.call('downvotePost', scope.post._id)
    scope.getMultilineText = (text) ->
      text.split('\n')
    scope.type = attrs.type
)
