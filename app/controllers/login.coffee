'use strict'

angular.module('oneImobiliaria')
.controller 'LoginCtrl', ['$scope', '$state', ($scope, $state) ->

  $scope.user = {}

  $scope.doLogin = () ->
    $state.go('dashboard.home')

]