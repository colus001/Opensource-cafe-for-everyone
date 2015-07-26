'use strict'

angular.module 'theCafeApp'
.config(($stateProvider) ->
  $stateProvider
  .state('boards-list',
    url: '/boards'
    templateUrl: 'client/boards/boards-list.view.ng.html'
    controller: 'BoardsListCtrl'
  )
  .state('board-detail',
    url: '/boards/:symbol'
    templateUrl: 'client/boards/board-detail.view.ng.html'
    controller: 'BoardDetailCtrl'
  )
)
