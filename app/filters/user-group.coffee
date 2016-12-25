'use strict'

angular.module('oneImobiliaria')
.filter 'groupName', ['UserGroupService', (UserGroupService) ->
  (group) ->

    return '' if not group? or group == ''
    items = UserGroupService.getAll()

    title = ''
    items.map (item) ->
      title = item.title if item.code == group

    return title
]