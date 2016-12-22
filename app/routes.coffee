'use strict'

angular.module('oneImobiliaria')
.config ['$stateProvider', '$httpProvider', '$urlRouterProvider', ($stateProvider, $httpProvider, $urlRouterProvider) ->

  $stateProvider

  .state 'login',
    url: '/login'
    views:
      main:
        templateUrl: 'app/views/login/index.html'
        controller: 'LoginCtrl'
      'error@login':
        templateUrl: 'app/views/error.html'
    requiredLogin: false

  .state 'dashboard',
    url: '/dashboard'
    abstract: true
    views:
      main: {}
      header:
        templateUrl: 'app/views/header.html'
      footer:
        templateUrl: 'app/views/footer.html'
    requiredLogin: true

  .state 'dashboard.home',
    url: '/home'
    views:
      'main@':
        templateUrl: 'app/views/home/index.html'
    requiredLogin: true

  .state 'dashboard.properties',
    url: '/properties'
    views:
      'main@':
        templateUrl: 'app/views/properties/index.html'
      'submenu@dashboard.properties':
        templateUrl: 'app/views/properties/submenu.html'
    requiredLogin: true

  $urlRouterProvider.otherwise('/login')

  $httpProvider.defaults.useXDomain = true
  $httpProvider.defaults.headers.common["Content-Type"] = 'application/json'
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]