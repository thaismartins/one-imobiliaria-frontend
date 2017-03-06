'use strict'

angular.module('oneImobiliaria')
.controller 'SearchCtrl', ['$scope', '$rootScope', '$loading', '$logger', 'storage', 'PropertyService', ($scope, $rootScope, $loading, $logger, storage, PropertyService) ->

  $scope.properties = []
  $scope.showFilters = true

  $scope.query =
    interest: {}
    property: {}

#  $loading.show()
#  UserService.getMyAccount()
#  .then (response) ->
#    $scope.user = response.data
#    $loading.hide()
#  .catch (response) ->
#    $logger.error('Erro ao buscar sua conta. Por favor, atualize a página.')
#    $loading.hide()

  resetValues = () ->
    $scope.query.interest.allMeters =  [10, 500]
    $scope.query.interest.allVacancies = [0, 10]
    $scope.query.interest.allFloors = [1, 30]
    $scope.query.interest.allValues = [1000, 5000000]
    $scope.query.interest.allIptus = [1000, 15000]
    $scope.query.interest.allCondominiums = [1000, 500000]
    $scope.query.interest.allLocations = [1000, 50000]

    $scope.query.property.allMeters =  [10, 500]
    $scope.query.property.allVacancies = [0, 10]
    $scope.query.property.allFloors = [1, 30]
    $scope.query.property.allValues = [1000, 5000000]
    $scope.query.property.allIptus = [1000, 15000]
    $scope.query.property.allCondominiums = [1000, 500000]
    $scope.query.property.allLocations = [1000, 50000]

  convertData = () ->
#    $scope.property.value = $scope.property.value.toFixed(2)
#    $scope.property.condominium = $scope.property.condominium.toFixed(2)
#    $scope.property.location = $scope.property.location.toFixed(2)
#    $scope.property.iptu = $scope.property.iptu.toFixed(2)

    $scope.query.property.meters =
      min: $scope.query.property.allMeters[0]
      max: $scope.query.property.allMeters[1]
    delete $scope.query.property.allMeters

    $scope.query.property.condominium =
      min: $scope.query.property.allCondominiums[0]
      max: $scope.query.property.allCondominiums[1]
    delete $scope.query.property.allCondominiums

    $scope.query.property.vacancy =
      min: $scope.query.property.allVacancies[0]
      max: $scope.query.property.allVacancies[1]
    delete $scope.query.property.allVacancies

    $scope.query.property.floor =
      min: $scope.query.property.allFloors[0]
      max: $scope.query.property.allFloors[1]
    delete $scope.query.property.allFloors

    $scope.query.property.value =
      min: $scope.query.property.allValues[0]
      max: $scope.query.property.allValues[1]
    delete $scope.query.property.allValues

    $scope.query.property.iptu =
      min: $scope.query.property.allIptus[0]
      max: $scope.query.property.allIptus[1]
    delete $scope.query.property.allIptus

    $scope.query.property.location =
      min: $scope.query.property.allLocations[0]
      max: $scope.query.property.allLocations[1]
    delete $scope.query.property.allLocations

    $scope.query.interest.meters =
      min: $scope.query.interest.allMeters[0]
      max: $scope.query.interest.allMeters[1]
    delete $scope.query.interest.allMeters

    $scope.query.interest.condominium =
      min: $scope.query.interest.allCondominiums[0]
      max: $scope.query.interest.allCondominiums[1]
    delete $scope.query.interest.allCondominiums

    $scope.query.interest.vacancy =
      min: $scope.query.interest.allVacancies[0]
      max: $scope.query.interest.allVacancies[1]
    delete $scope.query.interest.allVacancies

    $scope.query.interest.floor =
      min: $scope.query.interest.allFloors[0]
      max: $scope.query.interest.allFloors[1]
    delete $scope.query.interest.allFloors

    $scope.query.interest.value =
      min: $scope.query.interest.allValues[0]
      max: $scope.query.interest.allValues[1]
    delete $scope.query.interest.allValues

    $scope.query.interest.iptu =
      min: $scope.query.interest.allIptus[0]
      max: $scope.query.interest.allIptus[1]
    delete $scope.query.interest.allIptus

    $scope.query.interest.location =
      min: $scope.query.interest.allLocations[0]
      max: $scope.query.interest.allLocations[1]
    delete $scope.query.interest.allLocations

  resetValues()

  $scope.toggleFilters = () ->
    $scope.showFilters = !$scope.showFilters
    resetValues() if !$scope.showFilters

  $scope.doFilter = () ->

    $loading.show()
    convertData()
    PropertyService.search($scope.query)
    .then (response) ->
      console.log(response);
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao efetuar busca. Por favor, tente novamente.')
      $loading.hide()
]