'use strict'

angular.module('oneImobiliaria')
.filter 'typesToText', () ->
  (types) ->

    return 'Indefinido' unless types? and types.length > 0

    items =
      apartment: 'Apartamento'
      land: 'Tereno'
      car: 'Carro'
      house: 'Casa'

    values = []
    for type in types
      values.push(items[type]) if typeof items[type] != 'undefined'

    return values.join(' | ')