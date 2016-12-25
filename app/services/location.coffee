'use strict'

angular.module('oneImobiliaria')
.service 'LocationService', ['$http', '$state', 'RESOURCES', ($http, $state, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/cities'

  getAll: () ->
    return $http.get apiUrl
  getAllStates: () ->
    return $http.get apiUrl + '/states'
]