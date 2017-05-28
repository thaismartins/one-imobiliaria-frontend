'use strict'

angular.module('oneImobiliaria')
.controller 'ClientsCtrl', ['$scope', '$rootScope', '$state', '$stateParams', '$filter', '$loading', '$logger', 'storage', 'ClientService', ($scope, $rootScope, $state, $stateParams, $filter, $loading, $logger, storage, ClientService) ->

  $scope.client = {}
  $scope.clients = []
  $scope.search = {}

  $scope.edit = true
  $scope.showFilters = false

  $loading.show()
  if $stateParams.id
    ClientService.get($stateParams.id)
    .then (response) ->
      $scope.client = response.data
      $scope.edit = false
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar clientes. Por favor, atualize a página.')
      $loading.hide()
  else
    ClientService.getAll()
    .then (response) ->
      $scope.clients = $filter('orderBy')(response.data, '-created')
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar clientes. Por favor, atualize a página.')
      $loading.hide()

  $scope.canEdit = () ->
    $scope.edit = true

  $scope.toggleFilters = () ->
    $scope.showFilters = !$scope.showFilters

  $scope.saveOrUpdate = () ->
    if !$rootScope.forms.client.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $loading.show()
    ClientService.saveOrUpdate($scope.client)
    .then (response) ->
      $loading.hide()
      $state.go('dashboard.clients')
    .catch (response) ->
      $logger.error('Erro ao criar/editar cliente. Por favor, tente novamente.')
      $loading.hide()

  $scope.doDelete = (index) ->

    client = $scope.clients[index]
    return false if client._id == storage.getCode()

    $loading.show()
    ClientService.delete(client._id)
    .then (response) ->
      $logger.success('Cliente excluído com sucesso!')
      $scope.clients.splice(index, 1)
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao excluir cliente. Por favor, tente novamente.')
      $loading.hide()

]