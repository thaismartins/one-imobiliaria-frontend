'use strict'

angular.module 'oneImobiliaria', [
  'ui.router',
  'ui.utils.masks'
]
.run ['$rootScope', '$state', 'RESOURCES', ($rootScope, $state, RESOURCES) ->

  $rootScope.error = false
  $rootScope.success = false
  $rootScope.loading = false

  $rootScope.page = ''
  $rootScope.showMenu = false

  $rootScope.appTitle = 'One Consultoria Imobiliária'

  $rootScope.forms = {}

  $rootScope.toggleMenu = () ->
    $rootScope.showMenu = !$rootScope.showMenu

  $rootScope.$on '$stateChangeSuccess', () ->

    $rootScope.page = $state.current.name.replace('dashboard.', '')

    $rootScope.error = false
    $rootScope.success = false
    $rootScope.loading = false
    $rootScope.showMenu = false
]
.constant 'RESOURCES', {
  'API_URL': 'http://104.236.81.253:1337'
}