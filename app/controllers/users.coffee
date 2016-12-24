'use strict'

angular.module('oneImobiliaria')
.controller 'UsersCtrl', ['$scope', '$rootScope', '$state', '$filter', '$loading', '$logger', 'UserGroupService', 'UserService', ($scope, $rootScope, $state, $filter, $loading, $logger, UserGroupService, UserService) ->

  $scope.user = {}
  $scope.users = []

  $scope.groups = UserGroupService.getAll()
  $scope.edit = false

  $loading.show()
  UserService.getAll()
  .then (response) ->
    $scope.users = $filter('orderBy')(response.data, '-created')
    $loading.hide()
  .catch (response) ->
    $logger.error('Erro ao buscar usuários. Por favor, atualize a página.')
    $loading.hide()

  $scope.canEdit = () ->
    $scope.edit = true

  $scope.saveOrUpdate = () ->
    if !$rootScope.forms.user.$valid
      logger.error('Preencha todos os dados obrigatórios.')
      return

    UserService.create($scope.user)
    .then (response) ->
      console.log(response)
      $state.go('dashboard.users')
    .catch (response) ->
      console.log(response)
      logger.error('Erro ao criar usuário. Por favor, tente novamente.')

]