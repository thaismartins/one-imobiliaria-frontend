'use strict'

angular.module('oneImobiliaria')
.service 'NotificationService', ['$http', '$state', 'RESOURCES', ($http, $state, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/notifications'

  create: (notification) ->
    return $http.post apiUrl, notification
  getAll: () ->
    return $http.get apiUrl
  getAllByProperties: (propertyId, interestId) ->
    return $http.get apiUrl + '/property/' + propertyId + '/interest/' + interestId
  getAllByUser: (userId) ->
    return $http.get apiUrl + '/user/' + userId
  getAllByUserNotSeen: (userId) ->
    return $http.get apiUrl + '/user/' + userId + '?seen=1'
  get: (id) ->
    return $http.get apiUrl + '/' + id
  delete: (propertyId, interestId, userId) ->
    return $http.delete apiUrl+ '/' + userId + '?property=' + propertyId + '&interest=' + interestId
]