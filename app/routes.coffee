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

  .state 'dashboard.users',
    url: '/users'
    views:
      'main@':
        templateUrl: 'app/views/users/index.html'
        controller: 'UsersCtrl'
      'submenu@dashboard.users':
        templateUrl: 'app/views/users/submenu.html'
      'error@dashboard.users':
        templateUrl: 'app/views/error.html'
      'success@dashboard.users':
        templateUrl: 'app/views/success.html'
      'loading@dashboard.users':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.users.new',
    url: '/new'
    views:
      'main@':
        templateUrl: 'app/views/users/form.html'
        controller: 'UsersCtrl'
      'error@dashboard.users.new':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.users.new':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.users.edit',
    url: '/edit/:id'
    views:
      'main@':
        templateUrl: 'app/views/users/form.html'
        controller: 'UsersCtrl'
      'error@dashboard.users.edit':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.users.edit':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.clients',
    url: '/clients'
    views:
      'main@':
        templateUrl: 'app/views/clients/index.html'
        controller: 'ClientsCtrl'
      'submenu@dashboard.clients':
        templateUrl: 'app/views/clients/submenu.html'
      'error@dashboard.clients':
        templateUrl: 'app/views/error.html'
      'success@dashboard.clients':
        templateUrl: 'app/views/success.html'
      'loading@dashboard.clients':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.clients.new',
    url: '/new'
    views:
      'main@':
        templateUrl: 'app/views/clients/form.html'
        controller: 'ClientsCtrl'
      'error@dashboard.clients.new':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.clients.new':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.clients.edit',
    url: '/edit/:id'
    views:
      'main@':
        templateUrl: 'app/views/clients/form.html'
        controller: 'ClientsCtrl'
      'error@dashboard.clients.edit':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.users.edit':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.properties',
    url: '/properties'
    views:
      'main@':
        templateUrl: 'app/views/properties/index.html'
        controller: 'PropertiesCtrl'
      'submenu@dashboard.properties':
        templateUrl: 'app/views/properties/submenu.html'
      'error@dashboard.properties':
        templateUrl: 'app/views/error.html'
      'success@dashboard.properties':
        templateUrl: 'app/views/success.html'
      'loading@dashboard.properties':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.properties.new',
    url: '/new'
    views:
      'main@':
        templateUrl: 'app/views/properties/form.html'
        controller: 'PropertiesCtrl'
      'submenu@dashboard.properties.new':
        templateUrl: 'app/views/properties/form-submenu.html'
      'property@dashboard.properties.new':
        templateUrl: 'app/views/properties/property.html'
      'interest@dashboard.properties.new':
        templateUrl: 'app/views/properties/interest.html'
      'error@dashboard.properties.new':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.properties.new':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.properties.edit',
    url: '/edit/:id'
    views:
      'main@':
        templateUrl: 'app/views/properties/form.html'
        controller: 'PropertiesCtrl'
      'submenu@dashboard.properties.edit':
        templateUrl: 'app/views/properties/form-submenu.html'
      'property@dashboard.properties.edit':
        templateUrl: 'app/views/properties/property.html'
      'interest@dashboard.properties.edit':
        templateUrl: 'app/views/properties/interest.html'
      'error@dashboard.properties.edit':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.properties.edit':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.account',
    url: '/account'
    views:
      'main@':
        templateUrl: 'app/views/account/form.html'
        controller: 'AccountCtrl'
      'error@dashboard.account':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.account':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  $urlRouterProvider.otherwise('/login')

  # Access token injector
  $httpProvider.interceptors.push('sessionInjector')

  $httpProvider.defaults.useXDomain = true
  $httpProvider.defaults.headers.common["Content-Type"] = 'application/json'
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]