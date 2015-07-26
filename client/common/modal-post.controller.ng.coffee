'use strict'

angular.module('theCafeApp')
.controller('ModalPostCtrl', ($scope, $modalInstance, board) ->
  $scope.post = -> $modalInstance.close();
  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.newPost = _.defaults({}, board: board) if board
)
