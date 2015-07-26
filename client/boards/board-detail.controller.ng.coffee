'use strict'

angular.module('theCafeApp')
.controller('BoardDetailCtrl', ($scope, $stateParams, $meteor, $modal, $log) ->
  $scope.board = $meteor.object(Boards, $stateParams.boardId)
  $meteor.subscribe('boards')

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'client/common/modal-post.view.ng.html'
      controller: 'ModalPostCtrl'
      resolve:
        board: ->
          return $scope.board.title
    )

    # modalInstance.result.then(function (selectedItem) {
    #   $scope.selected = selectedItem;
    # }, function () {
    #   $log.info('Modal dismissed at: ' + new Date());
    # });
)
