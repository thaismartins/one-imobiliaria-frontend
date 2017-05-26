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

    values = []
    for type in types
      values.push(items[type])

    return values.join(' | ')