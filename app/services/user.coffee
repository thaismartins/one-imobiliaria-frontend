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
  update: (user) ->
    return $http.put apiUrl + '/' + user._id, user
  saveOrUpdate: (user) ->
    if user._id then this.update(user)
    else this.create(user)
  getAll: () ->
    return $http.get apiUrl
  get: (id) ->
    return $http.get apiUrl + '/' + id
  getMyAccount: () ->
    return $http.get apiUrl + '/' + storage.getCode()
  delete: (id) ->
    return $http.delete apiUrl+ '/' + id
]