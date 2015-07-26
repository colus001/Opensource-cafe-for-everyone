'use strict'

angular.module('theCafeApp')
.config(($stateProvider) ->
  $stateProvider
  .state('posts',
    url: '/posts'
    templateUrl: 'client/posts/posts.view.html'
    controller: 'PostsCtrl'
  )
)
