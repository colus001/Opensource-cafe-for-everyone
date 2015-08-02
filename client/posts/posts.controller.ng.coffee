'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  $scope.$meteorSubscribe('posts')
  $scope.$meteorSubscribe('comments')

  $meteor.autorun($scope, ->
    $scope.$meteorSubscribe('posts').then(->
      $scope.post = $scope.$meteorCollection(-> Posts.find(slug: $stateParams.postSlug))
      $scope.comments = $scope.$meteorCollection(->
        options = sort: { createdAt: -1 }
        Comments.find(postId: $scope.getReactively('post')[0]._id, options)
      )
    )
  )

  $scope.upvoted = (target) ->
    _.contains(target?.upvoters, Meteor.userId()) or false
  $scope.downvoted = (target) ->
    _.contains(target?.downvoters, Meteor.userId()) or false

  $scope.upvote = (comment) ->
    if comment
      $meteor.call('upvoteComment', comment._id)
    else
      $meteor.call('upvotePost', $stateParams.postSlug)

  $scope.downvote = (comment) ->
    if comment
      $meteor.call('downvoteComment', comment._id)
    else
      $meteor.call('downvotePost', $stateParams.postSlug)

  $scope.addComment = ->
    return unless $scope.commentForm.$valid
    _.extend($scope.newComment,
      # parentCommentId:
      # topLevelCommentId:
      postId: $scope.post[0]._id
    )
    Comments.insert($scope.newComment)
    $scope.newComment = undefined

  $scope.getBoardSymbol = -> $stateParams.symbol
)
