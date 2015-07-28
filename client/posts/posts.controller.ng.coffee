'use strict'

angular.module('theCafeApp')
.controller('PostsCtrl', ($scope, $stateParams, $meteor) ->
  $meteor.subscribe('posts')

  $meteor.autorun($scope, ->
    $scope.post = $meteor.collection(-> Posts.find({slug: $stateParams.postSlug}))
  )

  $scope.comments = [
    {
      _id: 'dkof31',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    }
    {
      _id: 'dfasdx',
      comment: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    }
    {
      _id: 'vf1xda',
      comment: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
    }
    {
      _id: 'sdf12d',
      comment: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim _id est laborum.'
    }
  ]

  $scope.getBoardSymbol = -> $stateParams.symbol
)
