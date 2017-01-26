'use strict'

angular.module('oneImobiliaria')
.controller 'PropertiesCtrl', ['$scope', '$rootScope', '$state', '$stateParams', '$filter', '$loading', '$logger', 'storage', 'PropertyService', 'LocationService', 'ClientService', ($scope, $rootScope, $state, $stateParams, $filter, $loading, $logger, storage, PropertyService, LocationService, ClientService) ->

  $scope.property =
    payments: []
    interest:
      types: []
      allMeters:  [10, 500]
      allVacancies: [0, 10]
      allFloors: [1, 30]
      allValues: [1000, 5000000]
      allIptus: [1000, 15000]
      allCondominiums: [1000, 500000]
      allLocations: [1000, 50000]

#  $scope.property = {
#    "code":"123",
#    "client":"585ecf5bd5af8351e3b894e3",
#    "type":"apartament",
#    "meters":100,
#    "vacancy":"1",
#    "floor":"2",
#    "address":{
#      "street":"Rua Simoes Delgado",
#      "number":"15",
#      "state":"SP",
#      "city":"São Paulo",
#      "neighborhood":"Jardim 9 de Julho",
#      "cep":"03952020"
#    },
#    "hasSubway":true,
#    "subwayStation":"Penha",
#    "value":1,
#    "condominium":2,
#    "iptu":3,
#    "location":4,
#    "payments": [
#      "financing",
#      "money",
#      "others"
#    ],
#    "exchange":0.1,
#    "difference":0.5,
#    "carValue":5,
#    "settled":true,
#    "car":true
#    interest:
#      types: []
#      allMeters:  [10, 500]
#      allVacancies: [0, 10]
#      allFloors: [1, 30]
#      allValues: [1000, 5000000]
#      allIptus: [1000, 15000]
#      allCondominiums: [1000, 500000]
#      allLocations: [1000, 50000]
#  }

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
      $scope.property.interest.allMeters = [52, 184]
      $scope.property.interest.allVacancies = [1, 3]
      $scope.property.interest.allFloors = [2, 10]
      $scope.property.interest.allValues = [2222, 1000000]
      $scope.property.interest.allIptus = [2222, 10000]
      $scope.property.interest.allCondominiums = [2222, 10000]
      $scope.property.interest.allLocations = [2222, 10000]
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

    convertData()
    PropertyService.saveOrUpdate($scope.property)
    .then (response) ->
      $loading.hide()
      $state.go('dashboard.properties')
    .catch (response) ->
      if response.data.code == 8
        $logger.error('Verifique o endereço digitado. Não foi possível validar esta informação.')
      else
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

  $scope.doUploadCSV = () ->
    console.log('Entrou....')
    console.log($scope.csv)


  convertData = () ->
    console.log('Entrou...')
    $scope.property.interest.meters =
      min: $scope.property.interest.allMeters[0]
      max: $scope.property.interest.allMeters[1]
    delete $scope.property.interest.allMeters

    $scope.property.interest.condominium =
      min: $scope.property.interest.allCondominiums[0]
      max: $scope.property.interest.allCondominiums[1]
    delete $scope.property.interest.allCondominiums

    $scope.property.interest.vacancy =
      min: $scope.property.interest.allVacancies[0]
      max: $scope.property.interest.allVacancies[1]
    delete $scope.property.interest.allVacancies

    $scope.property.interest.floor =
      min: $scope.property.interest.allFloors[0]
      max: $scope.property.interest.allFloors[1]
    delete $scope.property.interest.allFloors

    $scope.property.interest.value =
      min: $scope.property.interest.allValues[0]
      max: $scope.property.interest.allValues[1]
    delete $scope.property.interest.allValues

    $scope.property.interest.iptu =
      min: $scope.property.interest.allIptus[0]
      max: $scope.property.interest.allIptus[1]
    delete $scope.property.interest.allIptus

    $scope.property.interest.location =
      min: $scope.property.interest.allLocations[0]
      max: $scope.property.interest.allLocations[1]
    delete $scope.property.interest.allLocations
    console.log($scope.property.interest)

]
