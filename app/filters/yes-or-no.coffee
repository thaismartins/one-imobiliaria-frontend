'use strict'

angular.module('oneImobiliaria')
.filter 'yesOrNo', () ->
  (type) ->

    if type then 'Sim'
    else 'Não'