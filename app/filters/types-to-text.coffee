'use strict'

angular.module('oneImobiliaria')
.filter 'typesToText', () ->
  (types) ->

    return 'Indefinido' unless types? and types.length > 0

    items =
      apart: 'Apartamento'
      land: 'Tereno'
      car: 'Carro'
      house: 'Case'

    for type in types
      console.log(type)

    return types