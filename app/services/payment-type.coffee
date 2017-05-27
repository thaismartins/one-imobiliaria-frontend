'use strict'

angular.module('oneImobiliaria')
.service 'PaymentTypeService', () ->

  items = [
    {title: 'Financiamento', code: 'financing'},
    {title: 'Dinheiro', code: 'money'},
    {title: 'Outros', code: 'others'}
  ]

  getAll: () ->
    return items