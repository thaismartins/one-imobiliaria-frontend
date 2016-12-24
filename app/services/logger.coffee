'use strict'

angular.module('oneImobiliaria')
.service '$logger', ['$rootScope', ($rootScope) ->

  clean: () ->
    $rootScope.success = false
    $rootScope.error = false
    $rootScope.modalError = false
  error: (errorString) ->
    this.clean()
    $rootScope.error = errorString
  modalError: (errorString) ->
    this.clean()
    $rootScope.modalError = errorString
  success: (successString) ->
    this.clean()
    $rootScope.success = successString
]