'use strict'

angular.module('oneImobiliaria')
.service 'ClientService', ['$http', '$state', 'RESOURCES', ($http, $state, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/clients'

  create: (client) ->
    return $http.post apiUrl, client
  update: (client) ->
    return $http.put apiUrl + '/' + client._id, client
  saveOrUpdate: (client) ->
    if client._id then this.update(client)
    else this.create(client)
  getAll: () ->
    return $http.get apiUrl
  get: (id) ->
    return $http.get apiUrl + '/' + id
  delete: (id) ->
    return $http.delete apiUrl+ '/' + id
]