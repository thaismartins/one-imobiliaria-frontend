'use strict'

angular.module('oneImobiliaria')
.service 'UserGroupService', () ->

  items = [
    {title: 'Administrador', code: 'admin'},
    {title: 'Corretor(a)', code: 'broker'}
  ]

  getAll: () ->
    return items