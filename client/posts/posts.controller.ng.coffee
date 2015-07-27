'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  $meteor.subscribe('posts')

  $meteor.autorun($scope, ->
    $scope.post = $meteor.collection(-> Posts.find({slug: $stateParams.postSlug}))
  )

  $scope.getBoardSymbol = -> $stateParams.symbol
)
