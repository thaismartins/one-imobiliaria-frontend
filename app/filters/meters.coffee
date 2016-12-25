'use strict'

angular.module('oneImobiliaria')
.filter 'meters', () ->
  (meters) ->
    meters = '0' if not meters? or meters == ''
    return meters + ' m²'