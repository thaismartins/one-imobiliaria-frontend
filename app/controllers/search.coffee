'use strict'

angular.module('oneImobiliaria')
.controller 'SearchCtrl', ['$scope', '$rootScope', '$loading', '$logger', 'storage', 'PropertyService', ($scope, $rootScope, $loading, $logger, storage, PropertyService) ->

  $scope.properties = []
  $scope.showFilters = false

  $scope.query =
    interest: {}
    property: {}

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

  revertData = () ->
    resetValues()

    if $scope.property.interest.types?
      $scope.property.interest.types = []

    if $scope.property.interest.meters?
      $scope.property.interest.allMeters[0] = $scope.property.interest.meters.min
      $scope.property.interest.allMeters[1] = $scope.property.interest.meters.max

    if $scope.property.interest.condominium?
      $scope.property.interest.allCondominiums[0] = $scope.property.interest.condominium.min
      $scope.property.interest.allCondominiums[1] = $scope.property.interest.condominium.max

    if $scope.property.interest.vacancy?
      $scope.property.interest.allVacancies[0] = $scope.property.interest.vacancy.min
      $scope.property.interest.allVacancies[1] = $scope.property.interest.vacancy.max

    if $scope.property.interest.floor?
      $scope.property.interest.allFloors[0] = $scope.property.interest.floor.min
      $scope.property.interest.allFloors[1] = $scope.property.interest.floor.max

    if $scope.property.interest.value?
      $scope.property.interest.allValues[0] = $scope.property.interest.value.min
      $scope.property.interest.allValues[1] = $scope.property.interest.value.max

    if $scope.property.interest.iptu?
      $scope.property.interest.allIptus[0] = $scope.property.interest.iptu.min
      $scope.property.interest.allIptus[1] = $scope.property.interest.iptu.max

    if $scope.property.interest.location?
      $scope.property.interest.allLocations[0] = $scope.property.interest.location.min
      $scope.property.interest.allLocations[1] = $scope.property.interest.location.max

  convertData = () ->
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