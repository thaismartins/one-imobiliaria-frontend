'use strict'

angular.module('oneImobiliaria')
.service 'UserGroupService', () ->

  items = [
    {title: 'Administrador(a)', code: 'admin'},
    {title: 'Corretor(a)', code: 'broker'}
  ]

  getAll: () ->
    return items