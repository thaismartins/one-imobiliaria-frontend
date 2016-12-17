'use strict'

angular.module('oneImobiliaria')
.config ['$stateProvider', '$httpProvider', '$urlRouterProvider', ($stateProvider, $httpProvider, $urlRouterProvider) ->

  $stateProvider

  .state 'login',
    url: '/login'
    views:
      main:
        templateUrl: 'app/views/login.html'
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
    requiredLogin: true

  .state 'dashboard.home',
    url: '/home'
    views:
      'main@':
        templateUrl: 'app/views/home.html'
    requiredLogin: true

  $urlRouterProvider.otherwise('/login')

  $httpProvider.defaults.useXDomain = true
  $httpProvider.defaults.headers.common["Content-Type"] = 'application/json'
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]