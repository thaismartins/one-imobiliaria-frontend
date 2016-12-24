'use strict'

angular.module('oneImobiliaria')
.filter 'groupName', () ->
  (group) ->

    return '' if not group? or group == ''
    items = [
      {title: 'Administrador(a)', code: 'admin'},
      {title: 'Corretor(a)', code: 'broker'}
    ]

    title = ''
    items.map (item) ->
      title = item.title if item.code == group

    return title