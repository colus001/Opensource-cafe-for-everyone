'use strict'

angular.module('theCafeApp')
.config(($urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  # $urlRouterProvider.otherwise('/')
  $urlRouterProvider.otherwise('/board')
)
.run(($rootScope, $state) ->
  $rootScope.$on('$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    if error is 'AUTH_REQUIRED'
      $state.go('main')
  )
)
