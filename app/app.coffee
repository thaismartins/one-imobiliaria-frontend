'use strict'

angular.module 'oneImobiliaria', [
  'ui.router',
  'ui.utils.masks',
  'ui.slider'
]
.run ['$rootScope', '$state', 'RESOURCES', 'storage', 'UserService', ($rootScope, $state, RESOURCES, storage, UserService) ->

  $rootScope.error = false
  $rootScope.success = false
  $rootScope.loading = false

  $rootScope.fileUrl = RESOURCES.API_URL + '/'

  $rootScope.page = ''
  $rootScope.name = ''

  $rootScope.showMenu = false
  $rootScope.showSubmenu = false

  $rootScope.appTitle = 'One Consultoria Imobiliária'

  $rootScope.forms = {}

  $rootScope.doLogout = () ->
    UserService.doLogout()

  $rootScope.toggleMenu = () ->
    $rootScope.showMenu = !$rootScope.showMenu

  $rootScope.toggleSubmenu = () ->
    $rootScope.showSubmenu = !$rootScope.showSubmenu

  $rootScope.$on '$stateChangeSuccess', () ->

    page = $state.current.name.split('.')
    $rootScope.page = page[1] || ''

    $rootScope.group = storage.getGroup()
    $rootScope.name = storage.getName()

    $rootScope.error = false
    $rootScope.success = false
    $rootScope.loading = false
    $rootScope.showMenu = false
    $rootScope.showSubmenu = false

    UserService.doLogout() if $state.current.requiredLogin && !UserService.isLogged()
    $state.go('dashboard.home') if !$state.current.requiredLogin && UserService.isLogged()
    $state.go('dashboard.home') if $rootScope.page == 'users' && $rootScope.group != 'admin'
]
.constant 'RESOURCES',
#  'API_URL': 'http://desenv.doisoitosete.com:3000/api'
  'API_URL': process.env.API_URI || 'http://localhost:3000/api'
