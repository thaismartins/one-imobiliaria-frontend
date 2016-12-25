'use strict'

angular.module('oneImobiliaria')
.controller 'PropertiesCtrl', ['$scope', '$rootScope', '$state', '$stateParams', '$filter', '$loading', '$logger', 'storage', 'PropertyService', 'LocationService', ($scope, $rootScope, $state, $stateParams, $filter, $loading, $logger, storage, PropertyService, LocationService) ->

  $scope.property = {}
  $scope.properties = []
  $scope.cities = []
  $scope.states = []
  cities = []

  $scope.edit = true

  $loading.show()
  if $stateParams.id
    PropertyService.get($stateParams.id)
    .then (response) ->
      $scope.property = response.data
      $scope.edit = false
      return LocationService.getAll()
    .then (response) ->
      cities = $filter('orderBy')(response.data, 'name')
      return LocationService.getAllStates()
    .then (response) ->
      $scope.states = response.data.sort()
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar imóveis. Por favor, atualize a página.')
      $loading.hide()
  else
    PropertyService.getAll()
    .then (response) ->
      $scope.properties = $filter('orderBy')(response.data, '-created')
      return LocationService.getAll()
    .then (response) ->
      cities = $filter('orderBy')(response.data, 'name')
      return LocationService.getAllStates()
    .then (response) ->
      $scope.states = response.data.sort()
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar imóveis. Por favor, atualize a página.')
      $loading.hide()

  $scope.showCities = (state) ->
    $scope.cities = $filter('orderBy')(cities, {state: state})

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