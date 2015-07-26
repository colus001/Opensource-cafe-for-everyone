'use strict'

angular.module('theCafeApp')
.directive('toolbar', ->
  {
    restrict: 'AE'
    templateUrl: 'client/components/toolbar/toolbar.view.ng.html'
    replace: true
  }
)
