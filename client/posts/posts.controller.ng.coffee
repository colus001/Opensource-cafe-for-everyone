'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  slug = $stateParams.postSlug

  $scope.$meteorSubscribe('getPostBySlug', slug).then(->
    $scope.post = $meteor.object(Posts, slug: slug)
  )

  $meteor.autorun($scope, ->
    post = $scope.getReactively('post')
    return unless post
    $scope.$meteorSubscribe('getCommentByPostId', post._id)

    comments = Comments.find(postId: post._id).fetch()
    $scope.comments = Util.getCommentTree(comments)
  )

  $scope.addTopComment = ->
    return unless $scope.commentForm.$valid
    _.extend($scope.newComment,
      postId: $scope.post._id
    )
    $meteor.call('createComment', $scope.newComment)
    $scope.newComment = undefined

  $scope.getBoardSymbol = -> $stateParams.symbol
)
