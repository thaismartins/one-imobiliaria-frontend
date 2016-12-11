'use strict';

angular.module('oneImobiliaria', [
  'ui.router',
  'ui.utils.masks'
])
.run(['$rootScope', '$state', 'RESOURCES', function($rootScope, $state, RESOURCES) {

  $rootScope.error = false;
  $rootScope.success = false;
  $rootScope.loading = false;

  $rootScope.forms = {};

  return $rootScope.$on('$stateChangeSuccess', function() {
    $rootScope.error = false;
    $rootScope.success = false;
    $rootScope.loading = false;
  });
}])
.constant('RESOURCES', {
  'API_URL': 'http://104.236.81.253:1337'
});