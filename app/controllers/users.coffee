'use strict'

angular.module('oneImobiliaria')
.controller 'UsersCtrl', ['$scope', '$state', 'UserGroupService', ($scope, $state, UserGroupService) ->

  $scope.user =
    name: 'Thais Martins'
    email: 'contato@thaismartins.co'
    group: 'broker'

  $scope.groups = UserGroupService.getAll()
  $scope.edit = false

  $scope.canEdit = () ->
    $scope.edit = true

  $scope.saveOrUpdate = () ->
    $state.go('dashboard.users')

]