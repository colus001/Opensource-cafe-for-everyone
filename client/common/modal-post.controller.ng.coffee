'use strict'

angular.module('theCafeApp')
.controller('ModalPostCtrl', ($scope, $meteor, $modalInstance, symbol) ->
  $scope.post = ->
    return unless $scope.postForm.$valid
    $meteor.call('createPost', $scope.newPost)
    # Posts.insert($scope.newPost)
    $scope.newPost = undefined
    $modalInstance.close();
  $scope.cancel = -> $modalInstance.dismiss('cancel')
  $scope.newPost = _.defaults({}, board: symbol) if symbol
  $scope.getSlug = (text) -> Util.slugify(text, decode: false)
)
