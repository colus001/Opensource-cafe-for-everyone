'use strict'

angular.module('theCafeApp')
.controller('BoardDetailCtrl', ($scope, $stateParams, $meteor, $modal) ->
  symbol = $stateParams.symbol
  $scope.board = {}

  $scope.$meteorSubscribe('getBoardBySymbol', symbol).then(->
    $scope.board = $scope.$meteorObject(Boards, symbol: symbol)

    $scope.$meteorSubscribe('getPostsByBoardSymbol', $scope.getReactively('board').symbol)
    $scope.posts = $scope.$meteorCollection(->
      Posts.find(board: $scope.getReactively('board').symbol, DEFAULT_QUERY_OPTIONS)
    )
  )

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal-post.view.ng.html'
      controller: 'ModalPostCtrl'
      resolve:
        symbol: -> symbol
    )
)
