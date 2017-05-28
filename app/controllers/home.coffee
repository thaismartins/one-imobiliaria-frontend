'use strict'

angular.module('oneImobiliaria')
.controller 'HomeCtrl', ['$scope', '$state', '$loading', '$logger', 'storage', 'NotificationService', ($scope, $state, $loading, $logger, storage, NotificationService) ->

  $scope.notifications = []

  $loading.show()
  NotificationService.getAllByUserNotSeen(storage.getCode())
  .then (response) ->
    $scope.notifications = response.data
    $loading.hide()
  .catch (response) ->
    $logger.error('Erro ao buscar notificações. Por favor, atualize a página.')
    $loading.hide()


  $scope.removeNotification = (index) ->
    $scope.notifications.splice(index, 1)
]