'use strict'

angular.module('theCafeApp')
.controller('ModalNewBoardCtrl', ($scope, $meteor, $modalInstance) ->
  $scope.create = ->
    return unless $scope.boardForm.$valid
    $meteor.call('createBoard', $scope.newBoard)
    $scope.newBoard = undefined
    $modalInstance.close()

  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.slugify = (title) -> Util.slugify(title)
)
