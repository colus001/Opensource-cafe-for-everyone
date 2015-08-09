'use strict'

angular.module('theCafeApp')
.controller('BoardsListCtrl', ($scope, $meteor, $modal, $log) ->
  $meteor.subscribe('getPopularPosts')
  $meteor.subscribe('getAllBoards')
  $scope.boards = $scope.$meteorCollection(->
    Boards.find({})
  )
  $scope.posts = $scope.$meteorCollection(->
    Posts.find({}, _.defaults(limit: 5, DEFAULT_QUERY_OPTIONS))
  )

  $scope.getHref = (link) -> if link then "http://#{link}" else "#"

  $scope.remove = (board) ->
    $scope.boards.remove(board)

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal-new-board.view.ng.html'
      controller: 'ModalNewBoardCtrl'
    )
)
