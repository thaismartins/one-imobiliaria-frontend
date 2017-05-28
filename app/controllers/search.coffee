'use strict'

angular.module('oneImobiliaria')
.controller 'SearchCtrl', ['$scope', '$rootScope', '$loading', '$logger', 'storage', 'NotificationService', 'PropertyService', ($scope, $rootScope, $loading, $logger, storage, NotificationService, PropertyService) ->

  $scope.properties = []
  $scope.showFilters = false

  $scope.notifications = []
  $scope.notification = {}

  $scope.property = {}
  $scope.interest = {}

  $scope.query =
    interest: {}
    property: {}

  resetValues = () ->
    $scope.query.interest.allMeters =  [0, 500]
    $scope.query.interest.allVacancies = [0, 50]
    $scope.query.interest.allFloors = [0, 30]
    $scope.query.interest.allValues = [0, 5000000]
    $scope.query.interest.allIptus = [0, 15000]
    $scope.query.interest.allCondominiums = [0, 500000]
    $scope.query.interest.allLocations = [0, 50000]

    $scope.query.property.allMeters =  [0, 500]
    $scope.query.property.allVacancies = [0, 50]
    $scope.query.property.allFloors = [0, 30]
    $scope.query.property.allValues = [0, 5000000]
    $scope.query.property.allIptus = [0, 15000]
    $scope.query.property.allCondominiums = [0, 500000]
    $scope.query.property.allLocations = [0, 50000]

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
    if $scope.query.property.allMeters?
      $scope.query.property.meters =
        min: $scope.query.property.allMeters[0]
        max: $scope.query.property.allMeters[1]
      delete $scope.query.property.allMeters

    if $scope.query.property.allCondominiums?
      $scope.query.property.condominium =
        min: $scope.query.property.allCondominiums[0]
        max: $scope.query.property.allCondominiums[1]
      delete $scope.query.property.allCondominiums

    if $scope.query.property.allVacancies?
      $scope.query.property.vacancy =
        min: $scope.query.property.allVacancies[0]
        max: $scope.query.property.allVacancies[1]
      delete $scope.query.property.allVacancies

    if $scope.query.property.allFloors?
      $scope.query.property.floor =
        min: $scope.query.property.allFloors[0]
        max: $scope.query.property.allFloors[1]
      delete $scope.query.property.allFloors

    if $scope.query.property.allValues?
      $scope.query.property.value =
        min: $scope.query.property.allValues[0]
        max: $scope.query.property.allValues[1]
      delete $scope.query.property.allValues

    if $scope.query.property.allIptus?
      $scope.query.property.iptu =
        min: $scope.query.property.allIptus[0]
        max: $scope.query.property.allIptus[1]
      delete $scope.query.property.allIptus

    if $scope.query.property.allLocations?
      $scope.query.property.location =
        min: $scope.query.property.allLocations[0]
        max: $scope.query.property.allLocations[1]
      delete $scope.query.property.allLocations

    if $scope.query.interest.allMeters?
      $scope.query.interest.meters =
        min: $scope.query.interest.allMeters[0]
        max: $scope.query.interest.allMeters[1]
      delete $scope.query.interest.allMeters

    if $scope.query.interest.allCondominiums?
      $scope.query.interest.condominium =
        min: $scope.query.interest.allCondominiums[0]
        max: $scope.query.interest.allCondominiums[1]
      delete $scope.query.interest.allCondominiums

    if $scope.query.interest.allVacancies?
      $scope.query.interest.vacancy =
        min: $scope.query.interest.allVacancies[0]
        max: $scope.query.interest.allVacancies[1]
      delete $scope.query.interest.allVacancies

    if $scope.query.interest.allFloors?
      $scope.query.interest.floor =
        min: $scope.query.interest.allFloors[0]
        max: $scope.query.interest.allFloors[1]
      delete $scope.query.interest.allFloors

    if $scope.query.interest.allValues?
      $scope.query.interest.value =
        min: $scope.query.interest.allValues[0]
        max: $scope.query.interest.allValues[1]
      delete $scope.query.interest.allValues

    if $scope.query.interest.allIptus?
      $scope.query.interest.iptu =
        min: $scope.query.interest.allIptus[0]
        max: $scope.query.interest.allIptus[1]
      delete $scope.query.interest.allIptus

    if $scope.query.interest.allLocations?
      $scope.query.interest.location =
        min: $scope.query.interest.allLocations[0]
        max: $scope.query.interest.allLocations[1]
      delete $scope.query.interest.allLocations

  $scope.toggleFilters = () ->
    $scope.showFilters = !$scope.showFilters
    resetValues() if !$scope.showFilters

  $scope.doFilter = () ->
    $loading.show()
    convertData()
    find()

  $scope.showDetails = (item) ->
    return if not item?
    $scope.property = item.property
    $scope.interest = item.interest
    $rootScope.toggleModal()

  $scope.showNotifications = (item) ->
    return if not item?
    $scope.property = item.property
    $scope.interest = item.interest

    $loading.show()
    NotificationService.getAllByProperties(item.property._id, item.interest._id)
    .then (response) ->
      $scope.notifications = response.data
      $scope.notification.message = ''
      $rootScope.toggleModalNotifications()
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar notificações. Por favor, tente novamente.')
      $loading.hide()

  $scope.addNotification = () ->
    if !$rootScope.forms.notification.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $scope.notification.broker = storage.getCode()
    $scope.notification.property = $scope.property._id
    $scope.notification.interest = $scope.interest._id

    $loading.show()
    NotificationService.create($scope.notification)
    .then (response) ->
      $scope.notifications.unshift response.data
      $scope.notification.message = ''
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao adicionar notificação. Por favor, tente novamente.')
      $loading.hide()

  find = () ->
    PropertyService.search($scope.query)
    .then (response) ->
      $scope.properties = response.data
      $scope.showFilters = false
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao efetuar busca. Por favor, tente novamente.')
      $loading.hide()

  find()
]