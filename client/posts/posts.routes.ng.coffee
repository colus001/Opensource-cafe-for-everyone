'use strict'

angular.module('theCafeApp')
.config(($stateProvider) ->
  $stateProvider
  .state('posts',
    # url: '/board/meteor/HvMiWBPFAXRuLkvK4/asdf'
    url: '/board/:symbol/:userId/:postSlug'
    templateUrl: 'client/posts/posts.view.ng.html'
    controller: 'PostsCtrl'
  )
)
