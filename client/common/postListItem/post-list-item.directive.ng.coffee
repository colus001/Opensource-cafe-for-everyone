'use strict'

angular.module('theCafeApp')
.directive('postListItem', ($meteor) ->
  restrict: 'E'
  templateUrl: 'client/common/postListItem/post-list-item.view.ng.html'
  replace: true
  link: (scope, elem, attrs) ->
    scope.upvoted = (post) ->
      _.contains(post?.upvoters, Meteor.userId()) or false
    scope.downvoted = (post) ->
      _.contains(post?.downvoters, Meteor.userId()) or false
    scope.upvote = (post) ->
      $meteor.call('upvotePost', post._id)
    scope.downvote = (post) ->
      $meteor.call('downvotePost', post._id)
    scope.getMultilineText = (text) ->
      text.split('\n')
    scope.type = attrs.type
)
