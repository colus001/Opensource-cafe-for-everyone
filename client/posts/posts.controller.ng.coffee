'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  $meteor.subscribe('comments')
  $meteor.subscribe('posts').then(->
    $scope.comments = $meteor.collection(->
      options = sort: { createdAt: -1 }
      Comments.find(postId: $scope.getReactively('post')[0]._id, options)
    )
  )

  $meteor.autorun($scope, ->
    $scope.post = $meteor.collection(-> Posts.find(slug: $stateParams.postSlug))
  )

  $scope.addComment = ->
    return unless $scope.commentForm.$valid
    _.extend($scope.newComment,
      # parentCommentId:
      # topLevelCommentId:
      author: Meteor.user().name or Meteor.user().emails[0].address
      createdAt: new Date()
      createdBy: Meteor.userId()
      postId: $scope.post[0]._id
    )
    Comments.insert($scope.newComment)
    $scope.newComment = undefined

  $scope.getBoardSymbol = -> $stateParams.symbol
)
