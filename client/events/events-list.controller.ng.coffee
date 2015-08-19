'use strict'

angular.module 'theCafeApp'
.controller 'EventsListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.events = $meteor.collection () ->
    Events.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('events', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.eventsCount = $meteor.object Counts, 'numberOfEvents', false
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.events.save $scope.newEvent
      $scope.newEvent = undefined
      
  $scope.remove = (event) ->
    $scope.events.remove event
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]