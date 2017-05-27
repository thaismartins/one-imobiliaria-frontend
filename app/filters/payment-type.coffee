'use strict'

angular.module('oneImobiliaria')
.filter 'paymentType', ['PaymentTypeService', (PaymentTypeService) ->
  (paymentsType) ->

    return '' if not paymentsType? or paymentsType == '' or paymentsType.length == 0
    items = PaymentTypeService.getAll()

    findTitle = (paymentType) ->
      title = ''
      items.map (item) ->
        title = item.title if item.code == paymentType
      return title

    types = []
    paymentsType.map (type) ->
      if type? or type == ''
        title = findTitle(type)
        types.push title if title != ''

    return types.join(' | ')
]