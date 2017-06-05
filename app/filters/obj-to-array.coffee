'use strict'

angular.module('oneImobiliaria')
.filter 'objToArray', () ->
  (obj, total) ->

    return [] if not obj? or obj == '' or not obj instanceof Object

    return obj if obj instanceof Array

    array = []
    for i in [0...total]
      if typeof obj[i] == 'undefined'
        array.push null
      else
        array.push obj[i]

    return array