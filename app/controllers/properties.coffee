'use strict'

angular.module('oneImobiliaria')
.controller 'PropertiesCtrl', ['$scope', '$rootScope', '$state', '$stateParams', '$filter', '$loading', '$logger', 'storage', 'PropertyService', 'LocationService', 'ClientService', ($scope, $rootScope, $state, $stateParams, $filter, $loading, $logger, storage, PropertyService, LocationService, ClientService) ->

  $scope.property = {payments: []}
  $scope.properties = []
  $scope.cities = []
  $scope.states = []
  $scope.clients = []
  cities = []

  $scope.edit = true

  $loading.show()
  if $stateParams.id
    PropertyService.get($stateParams.id)
    .then (response) ->
      $scope.property = response.data
      return LocationService.getAllStates()
    .then (response) ->
      $scope.states = response.data.sort()
      return LocationService.getCitiesByState($scope.property.address.state)
    .then (response) ->
      currentCities = $filter('orderByString')(response.data, 'name')
      $scope.cities = currentCities
      cities[$scope.property.address.state] = currentCities
      return ClientService.getAll()
    .then (response) ->
      $scope.clients = $filter('orderByString')(response.data, 'name')
      $scope.edit = false
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar imóveis. Por favor, atualize a página.')
      $loading.hide()
  else
    PropertyService.getAll()
    .then (response) ->
      $scope.properties = $filter('orderBy')(response.data, '-created')
      return LocationService.getAllStates()
    .then (response) ->
      $scope.states = response.data.sort()
      return ClientService.getAll()
    .then (response) ->
      $scope.clients = $filter('orderByString')(response.data, 'name')
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar imóveis. Por favor, atualize a página.')
      $loading.hide()

  $scope.showCities = (state) ->

    if cities[state]?
      $scope.cities = cities[state]
      return false

    $loading.show()
    LocationService.getCitiesByState(state)
    .then (response) ->
      currentCities = $filter('orderByString')(response.data, 'name')
      $scope.cities = currentCities
      cities[state] = currentCities
      $loading.hide()
    .catch () ->
      $loading.hide()


  $scope.canEdit = () ->
    $scope.edit = true

  $scope.saveOrUpdate = () ->
    if !$rootScope.forms.property.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $loading.show()
    PropertyService.saveOrUpdate($scope.property)
    .then (response) ->
      $loading.hide()
      $state.go('dashboard.properties')
    .catch (response) ->
      $logger.error('Erro ao criar/editar imóvel. Por favor, tente novamente.')
      $loading.hide()

  $scope.doDelete = (index) ->

    property = $scope.properties[index]
    return false if property._id == storage.getCode()

    $loading.show()
    PropertyService.delete(property._id)
    .then (response) ->
      $logger.success('Imóvel excluído com sucesso!')
      $scope.properties.splice(index, 1)
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao excluir imóvel. Por favor, tente novamente.')
      $loading.hide()

]
