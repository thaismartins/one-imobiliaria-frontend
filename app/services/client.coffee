'use strict'

angular.module('oneImobiliaria')
.service 'ClientService', ['$http', '$state', 'RESOURCES', ($http, $state, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/clients'

  create: (user) ->
    return $http.post apiUrl, user
  update: (user) ->
    return $http.put apiUrl + '/' + user._id, user
  saveOrUpdate: (user) ->
    if user._id then this.update(user)
    else this.create(user)
  getAll: () ->
    return $http.get apiUrl
  get: (id) ->
    return $http.get apiUrl + '/' + id
  delete: (id) ->
    return $http.delete apiUrl+ '/' + id
]