'use strict'

COMMENT_DEFAULT_QUERY =
  parentCommentId: null

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
    $scope.comments = $scope.$meteorCollection(->
      query = _.defaults(COMMENT_DEFAULT_QUERY, postId: post._id)
      Comments.find(query, DEFAULT_QUERY_OPTIONS)
    )
  )

  $scope.addComment = ->
    return unless $scope.commentForm.$valid
    _.extend($scope.newComment,
      postId: $scope.post._id
    )
    $meteor.call('createComment', $scope.newComment)
    $scope.newComment = undefined

  $scope.getBoardSymbol = -> $stateParams.symbol
)
