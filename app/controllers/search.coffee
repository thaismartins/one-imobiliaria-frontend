'use strict'

angular.module('oneImobiliaria')
.controller 'SearchCtrl', ['$scope', '$rootScope', '$loading', '$logger', 'storage', 'PropertyService', ($scope, $rootScope, $loading, $logger, storage, PropertyService) ->

  $scope.properties = []
  $scope.showFilters = false

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

  resetValues()

  $scope.toggleFilters = () ->
    $scope.showFilters = !$scope.showFilters
    resetValues() if !$scope.showFilters

  $scope.doFilter = () ->
    if !$rootScope.forms.user.$valid
      $logger.error('Preencha todos os dados obrigatórios.')
      return

    $loading.show()
    UserService.update($scope.user)
    .then (response) ->
      $logger.success('Sua conta foi atualizada com sucesso!')
      storage.updateToken(response.data.token)
      $loading.hide()
    .catch (response) ->
      $logger.error('Erro ao editar sua conta. Por favor, tente novamente.')
      $loading.hide()
]