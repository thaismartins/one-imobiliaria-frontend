'use strict'

angular.module('oneImobiliaria')
.controller 'LoginCtrl', ['$scope', '$rootScope', '$state', '$logger', 'storage', 'UserService', ($scope, $rootScope, $state, $logger, storage, UserService) ->

  $scope.user = {}

  $scope.doLogin = () ->
    if !$rootScope.forms.login.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $scope.user.origin = 'admin'
    UserService.doLogin($scope.user)
    .then (response) ->
      storage.setCodes(response.data)
      $state.go('dashboard.home')
    .catch (response) ->
      $logger.error('Usuário e/ou senha inválido(s).')
]