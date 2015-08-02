'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  $scope.$meteorSubscribe('posts')
  $scope.$meteorSubscribe('comments')

  $meteor.autorun($scope, ->
    $scope.$meteorSubscribe('posts').then(->
      $scope.posts = $scope.$meteorCollection(-> Posts.find(slug: $stateParams.postSlug))
      $scope.comments = $scope.$meteorCollection(->
        options = sort: { score: -1, createdAt: -1 }
        Comments.find(postId: $scope.getReactively('posts')[0]._id, options)
      )
    )
  )

  $scope.addComment = ->
    return unless $scope.commentForm.$valid
    _.extend($scope.newComment,
      # parentCommentId:
      # topLevelCommentId:
      postId: $scope.posts[0]._id
    )
    Comments.insert($scope.newComment)
    $scope.newComment = undefined

  $scope.getBoardSymbol = -> $stateParams.symbol
)
