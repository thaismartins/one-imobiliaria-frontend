'use strict'

angular.module('oneImobiliaria')
.filter 'propertyType', ['PropertyTypeService', (PropertyTypeService) ->
  (propertyType) ->

    return '' if not propertyType? or propertyType == ''
    items = PropertyTypeService.getAll()

    title = ''
    items.map (item) ->
      title = item.title if item.code == propertyType

    return title
]