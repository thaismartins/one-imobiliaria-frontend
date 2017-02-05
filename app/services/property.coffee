'use strict'

angular.module('oneImobiliaria')
.service 'PropertyService', ['$http', '$state', 'RESOURCES', ($http, $state, RESOURCES) ->

  apiUrl = RESOURCES.API_URL + '/properties'

  create: (property) ->
    return $http.post apiUrl, property
  update: (property) ->
    return $http.put apiUrl + '/' + property._id, property
  saveOrUpdate: (property) ->
    if property._id then this.update(property)
    else this.create(property)
  getAll: () ->
    return $http.get apiUrl
  get: (id) ->
    return $http.get apiUrl + '/' + id
  delete: (id) ->
    return $http.delete apiUrl + '/' + id
  importCsv: (file) ->

    form = new FormData()
    form.append 'csv', file

    return $http.post apiUrl + '/import/csv', form,
      withCredentials: false
      headers:
        'Content-Type': undefined
      transformRequest: angular.identity

]