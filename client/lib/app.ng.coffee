angular.module('theCafeApp', [
  'angular-meteor'
  'ui.router'
  'ui.bootstrap'
  'angularUtils.directives.dirPagination'
])

onReady = ->
  angular.bootstrap(document, ['theCafeApp'])

if Meteor.isCordova
  angular.element(document).on('deviceready', onReady)
else
  angular.element(document).ready(onReady)
