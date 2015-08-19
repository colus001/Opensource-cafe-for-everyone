'use strict'

angular.module('theCafeApp')
.config(($stateProvider) ->
  $stateProvider
  .state('events-list',
    url: '/event'
    templateUrl: 'client/events/events-list.view.ng.html'
    controller: 'EventsListCtrl'
  )
  .state('event-detail',
    url: '/event/:eventId'
    templateUrl: 'client/events/event-detail.view.ng.html'
    controller: 'EventDetailCtrl'
  )
  .state('event-create',
    url: '/event/create'
    templateUrl: 'client/event/event-create.view.ng.html'
    controller: 'EventCreateCtrl'
  )
)
