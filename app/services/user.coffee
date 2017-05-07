'use strict'

angular.module('oneImobiliaria')
.service 'UserService', ['$http', '$q', '$state', 'storage', 'RESOURCES', ($http, $q, $state, storage, RESOURCES) ->

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
  savePhoto: (photo) ->
    q = $q.defer()

    if not photo? or not photo.name?
      q.resolve({data: {file: null}})
    else
      file = new FormData
      file.append('photo', photo)

      $http.post apiUrl + '/photo', file, {
        withCredentials: false
        headers:
          'Content-Type': undefined
        transformRequest: angular.identity
      }
      .then (response) ->
        q.resolve(response)
      .catch (error) ->
        q.reject(error)

    return q.promise
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