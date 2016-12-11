'use strict';

angular.module('oneImobiliaria')
.config(['$stateProvider', '$httpProvider', '$urlRouterProvider', function($stateProvider, $httpProvider, $urlRouterProvider) {
    $stateProvider.state('login', {
      url: '/login',
      views: {
        main: {
          templateUrl: 'app/views/login.html',
          controller: 'LoginCtrl'
        },
        'error@login': {
          templateUrl: 'app/views/error.html'
        }
      },
     requiredLogin: false
  });

  $urlRouterProvider.otherwise('/login');

  $httpProvider.defaults.useXDomain = true;
  $httpProvider.defaults.headers.common["Content-Type"] = 'application/json';
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);