'use strict'

angular.module('oneImobiliaria')
.filter 'address', () ->
  (address) ->

    if not address? || (not address.street? and not address.number? and not address.complement?)
      return 'Indefinido'

    fullAddress = ''

    if address.street?
      fullAddress += address.street

    if address.number?
      fullAddress += ', ' + address.number

    if address.complement?
      fullAddress += ' - ' + address.complement

    return fullAddress