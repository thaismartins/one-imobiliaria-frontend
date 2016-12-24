'use strict'

angular.module('oneImobiliaria')
.service '$loading', ['$rootScope', ($rootScope) ->

  show: () ->
    $rootScope.loading = true
  hide: () ->
    $rootScope.loading = false

]