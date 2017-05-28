'use strict'

angular.module('oneImobiliaria')
.controller 'NotificationCtrl', ['$scope', '$rootScope', '$stateParams', '$loading', '$logger', 'storage', 'NotificationService', ($scope, $rootScope, $stateParams, $loading, $logger, storage, NotificationService) ->

  $scope.notifications = []
  $scope.notification = {}

  $scope.property = null
  $scope.interest = null

  if $stateParams.propertyId and $stateParams.interestId
    $loading.show()
    NotificationService.getAllByProperties($stateParams.propertyId, $stateParams.interestId)
    .then (response) ->
      $scope.notifications = response.data
      $scope.property = $stateParams.propertyId
      $scope.interest = $stateParams.interestId
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar notificação. Por favor, atualize a página.')
      $loading.hide()
  else
    $loading.show()
    NotificationService.getAllByUser(storage.getCode())
    .then (response) ->
      $scope.notifications = response.data
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao buscar notificações. Por favor, atualize a página.')
      $loading.hide()

  $scope.addNotification = () ->
    if !$rootScope.forms.notification.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $scope.notification.broker = storage.getCode()
    $scope.notification.property = $scope.property
    $scope.notification.interest = $scope.interest

    $loading.show()
    NotificationService.create($scope.notification)
    .then (response) ->
      $scope.notifications.unshift response.data
      $scope.notification.message = ''
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao adicionar notificação. Por favor, tente novamente.')
      $loading.hide()
]