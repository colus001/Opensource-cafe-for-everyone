'use strict'

angular.module('theCafeApp')
.controller('BoardsListCtrl', ($scope, $meteor, $modal, $log) ->
  $scope.page = 1
  $scope.perPage = 10
  $scope.sort = title_sort : 1
  $scope.orderProperty = '1'

  $scope.boards = $meteor.collection(->
    Boards.find({}, { sort:$scope.getReactively('sort') })
  )
  $scope.posts = $meteor.collection(->
    Posts.find({}, { sort:$scope.getReactively('sort') })
  )

  $meteor.autorun($scope, ->
    $meteor.subscribe('posts')
    $meteor.subscribe('boards')
  )

  $scope.getHref = (link) -> if link then "http://#{link}" else "#"

  $scope.remove = (board) ->
    $scope.boards.remove(board)

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage

  $scope.$watch('orderProperty', ->
    if $scope.orderProperty
      $scope.sort = title_sort: parseInt($scope.orderProperty)
  )

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal-new-board.view.ng.html'
      controller: 'ModalNewBoardCtrl'
    )
)
