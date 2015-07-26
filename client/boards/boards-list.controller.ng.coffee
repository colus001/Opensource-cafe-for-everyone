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

  $meteor.autorun($scope, ->
    $meteor
      .subscribe('boards', {
        limit: parseInt($scope.getReactively('perPage'))
        skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
        sort: $scope.getReactively('sort')
      }, $scope.getReactively('search'))
      .then(->
        $scope.boardsCount = $meteor.object(Counts, 'numberOfBoards', false)
      )
  )

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
