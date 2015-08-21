'use strict'

angular.module('theCafeApp')
.controller('BoardsListCtrl', ($scope, $meteor, $modal, $log) ->
  $scope.$meteorSubscribe('getPopularPosts')
  $scope.$meteorSubscribe('getAllBoards')
  $scope.boards = $scope.$meteorCollection(->
    Boards.find({})
  )
  $scope.posts = $scope.$meteorCollection(->
    Posts.find({}, _.defaults(DEFAULT_QUERY_OPTIONS))
  )

  $scope.getHref = (link) -> if link then "http://#{link}" else "#"

  $scope.remove = (board) ->
    $scope.boards.remove(board)

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal/modal-new-board.view.ng.html'
      controller: 'ModalNewBoardCtrl'
    )
)
