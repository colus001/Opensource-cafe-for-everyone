'use strict'

angular.module('theCafeApp')
.controller('ModalPostCtrl', ($scope, $modalInstance, symbol) ->
  $scope.post = ->
    return unless $scope.postForm.$valid
    Posts.insert($scope.newPost)
    $scope.newPost = undefined
    $modalInstance.close();
  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.newPost = _.defaults({}, board: symbol) if symbol
)
