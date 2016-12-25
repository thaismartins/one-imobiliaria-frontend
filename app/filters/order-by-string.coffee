'use strict'

angular.module('oneImobiliaria')
.filter 'orderByString', () ->
  (array, property, reverse) ->
    result = array.sort (object1, object2) ->
      object1.localeCompare(object2) if angular.isUndefined(property)
      object1[property].localeCompare(object2[property])

    if reverse then result.reverse()
    else result