'use strict'

angular.module 'theCafeApp'
.controller('EventCreateCtrl', ($scope, $stateParams, $meteor) ->
  $scope.event = $meteor.object Events, $stateParams.eventId
  $meteor.subscribe('events')

  $scope.save = () ->
    if $scope.form.$valid
      $scope.event.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )

  $scope.reset = () ->
    $scope.event.reset()
)
