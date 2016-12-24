'use strict'

angular.module('oneImobiliaria')
.service 'UserService', ['$http', '$state', 'storage', 'RESOURCES', ($http, $state, storage, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/accounts'

  isLogged: () ->
    return storage.isLogged()
  doLogin: (user) ->
    return $http.post apiUrl + '/auth', user
  doLogout: () ->
      storage.clean()
      $state.go('login')
      return
  create: (user) ->
    return $http.post apiUrl, user
  getAll: () ->
    return $http.get apiUrl
  delete: (user) ->
    return $http.delete apiUrl+ '/' + user.id
]