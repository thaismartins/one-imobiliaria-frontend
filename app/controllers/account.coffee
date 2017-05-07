'use strict'

angular.module('oneImobiliaria')
.controller 'AccountCtrl', ['$scope', '$rootScope', '$loading', '$logger', 'storage', 'UserService', ($scope, $rootScope, $loading, $logger, storage, UserService) ->

  $scope.user = {}
  $scope.edit = false

  $scope.file = {}
  $scope.fileName = 'Selecione um arquivo'

  $loading.show()
  UserService.getMyAccount()
  .then (response) ->
    $scope.user = response.data
    $loading.hide()
  .catch (response) ->
    $logger.error('Erro ao buscar sua conta. Por favor, atualize a página.')
    $loading.hide()

  $scope.canEdit = () ->
    $scope.edit = true

  $scope.selectPhoto = () ->
    if not $scope.file.name?
      $scope.file = {}
      $scope.fileName = 'Selecione um arquivo'
      return false

    $scope.fileName = $scope.file.name

  $scope.doUpdate = () ->
    if !$rootScope.forms.user.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $loading.show()
    UserService.savePhoto($scope.file)
    .then (response) ->
      $scope.user.photo if response.data.file
      return UserService.update($scope.user)
    .then (response) ->
      $logger.success('Sua conta foi atualizada com sucesso!')
      storage.updateToken(response.data.token)
      $loading.hide()
    .catch (response) ->
      console.log(response);
      $logger.error('Erro ao editar sua conta. Por favor, tente novamente.')
      $loading.hide()
]