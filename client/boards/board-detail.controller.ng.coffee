'use strict'

angular.module('theCafeApp')
.controller('BoardDetailCtrl', ($scope, $stateParams, $meteor, $modal, $log) ->
  $meteor.subscribe('boards')
  $meteor.subscribe('posts')

  $meteor.autorun($scope, ->
    $scope.board = $meteor.object(Boards, symbol: $stateParams.symbol)
    $scope.posts = $meteor.collection(-> Posts.find({boardId: $scope.board._id}))
  )

  $scope.getHref = (link) -> if link then "http://#{link}" else "#"

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal-post.view.ng.html'
      controller: 'ModalPostCtrl'
      resolve:
        symbol: ->
          return $scope.board.symbol
    )

    # modalInstance.result.then(function (selectedItem) {
    #   $scope.selected = selectedItem;
    # }, function () {
    #   $log.info('Modal dismissed at: ' + new Date());
    # });
)
