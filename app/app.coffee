'use strict'

angular.module 'oneImobiliaria', [
  'ui.router',
  'ui.utils.masks'
]
.run ['$rootScope', '$state', 'RESOURCES', ($rootScope, $state, RESOURCES) ->

  $rootScope.error = false
  $rootScope.success = false
  $rootScope.loading = false

  $rootScope.appTitle = 'One Consultoria Imobiliária'

  $rootScope.forms = {}

  $rootScope.$on '$stateChangeSuccess', () ->
    $rootScope.error = false
    $rootScope.success = false
    $rootScope.loading = false
]
.constant 'RESOURCES', {
  'API_URL': 'http://104.236.81.253:1337'
}