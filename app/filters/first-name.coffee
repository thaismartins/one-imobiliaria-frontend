'use strict'

angular.module('oneImobiliaria')
.filter 'firstName', () ->
  (name) ->

    return '' if not name? or name == ''
    names = name.split(' ')
    return names[0]