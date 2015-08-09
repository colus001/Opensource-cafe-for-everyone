'use strict'

angular.module('theCafeApp')
.controller('ModalNewBoardCtrl', ($scope, $modalInstance) ->
  $scope.create = ->
    return unless $scope.boardForm.$valid
    new Board($scope.newBoard).save()
    $scope.newBoard = undefined
    $modalInstance.close()

  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.slugify = (title) -> Util.slugify(title)
)
