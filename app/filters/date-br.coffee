'use strict'

angular.module('oneImobiliaria')
.filter 'dateBr', () ->
  (input) ->

    return '' if not input?
    date = input.split('T')

    moment(date[0]).format('DD/MM/YYYY')