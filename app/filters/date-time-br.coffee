'use strict'

angular.module('oneImobiliaria')
.filter 'dateTimeBr', () ->
  (input) ->
    return '' if not input?
    moment.locale('pt-br')
    moment(input).calendar(null, {sameElse: 'DD/MM/YYYY - H:mm'})