'use strict'

angular.module('oneImobiliaria')
.service 'sessionInjector', ['storage', (storage) ->

  isUnloggedPage = (config) ->
    return (config.url.indexOf('auth') > -1 or config.url.indexOf('remember') > -1)

  request: (config)->
    if !isUnloggedPage(config)
      config.headers['x-access-token'] = storage.getSessionToken()
    return config
]