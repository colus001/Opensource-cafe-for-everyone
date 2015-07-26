'use strict'

angular.module('theCafeApp')
.controller('ModalNewBoardCtrl', ($scope, $modalInstance) ->
  $scope.create = ->
    return unless $scope.boardForm.$valid
    Boards.insert($scope.newBoard)
    $scope.newBoard = undefined
    $modalInstance.close()

  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.slugify = (title) -> Util.slugify(title)
)
