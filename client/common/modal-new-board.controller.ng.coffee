'use strict'

angular.module('theCafeApp')
.controller('ModalNewBoardCtrl', ($scope, $modalInstance) ->
  $scope.post = -> $modalInstance.close()
  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.slugify = (title) -> Util.slugify(title)
)
