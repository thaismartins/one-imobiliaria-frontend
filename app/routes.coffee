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
        controller: 'HomeCtrl'
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
      'submenu@dashboard.users.new':
        templateUrl: 'app/views/users/form-submenu.html'
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
      'submenu@dashboard.users.edit':
        templateUrl: 'app/views/users/form-submenu.html'
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
      'filter@dashboard.clients':
        templateUrl: 'app/views/clients/filter.html'
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
      'client@dashboard.clients.new':
        templateUrl: 'app/views/clients/client.html'
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
      'filter@dashboard.properties':
        templateUrl: 'app/views/properties/filter.html'
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

  .state 'dashboard.confirm',
    url: '/confirm'
    views:
      'main@':
        templateUrl: 'app/views/confirm/index.html'
        controller: 'ConfirmCtrl'
      'submenu@dashboard.confirm':
        templateUrl: 'app/views/confirm/submenu.html'
      'modal@dashboard.confirm':
        templateUrl: 'app/views/confirm/modal.html'
      'error@dashboard.confirm':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.confirm':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.account',
    url: '/account'
    views:
      'main@':
        templateUrl: 'app/views/account/form.html'
        controller: 'AccountCtrl'
      'submenu@dashboard.account':
        templateUrl: 'app/views/account/form-submenu.html'
      'error@dashboard.account':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.account':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.search',
    url: '/search'
    views:
      'main@':
        templateUrl: 'app/views/search/index.html'
        controller: 'SearchCtrl'
      'submenu@dashboard.search':
        templateUrl: 'app/views/search/submenu.html'
      'submenu-filter@dashboard.search':
        templateUrl: 'app/views/search/submenu-filter.html'
      'filters-interest@dashboard.search':
        templateUrl: 'app/views/search/filters-interest.html'
        controller: 'AccountCtrl'
      'filters-property@dashboard.search':
        templateUrl: 'app/views/search/filters-property.html'
        controller: 'AccountCtrl'
      'modal@dashboard.search':
        templateUrl: 'app/views/search/modal.html'
      'modal-notifications@dashboard.search':
        templateUrl: 'app/views/search/modal-notifications.html'
      'error@dashboard.search':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.search':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.notifications',
    url: '/notifications'
    views:
      'main@':
        templateUrl: 'app/views/notifications/index.html'
        controller: 'NotificationCtrl'
      'submenu@dashboard.notifications':
        templateUrl: 'app/views/notifications/submenu.html'
      'error@dashboard.notifications':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.notifications':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  .state 'dashboard.notifications.edit',
    url: '/notifications/property/:propertyId/interest/:interestId'
    views:
      'main@':
        templateUrl: 'app/views/notifications/form.html'
        controller: 'NotificationCtrl'
      'submenu@dashboard.notifications.edit':
        templateUrl: 'app/views/notifications/submenu.html'
      'error@dashboard.notifications.edit':
        templateUrl: 'app/views/error.html'
      'loading@dashboard.notifications.edit':
        templateUrl: 'app/views/loading.html'
    requiredLogin: true

  $urlRouterProvider.otherwise('/login')

  # Access token injector
  $httpProvider.interceptors.push('sessionInjector')

  $httpProvider.defaults.useXDomain = true
  $httpProvider.defaults.headers.common["Content-Type"] = 'application/json'
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]