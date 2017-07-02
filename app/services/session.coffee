'use strict'

angular.module('oneImobiliaria')
.service 'sessionInjector', ['storage', '$injector', '$q', (storage, $injector, $q) ->

  isUnloggedPage = (config) ->
    return (config.url.indexOf('auth') > -1 or config.url.indexOf('remember') > -1)

  request: (config)->
    if !isUnloggedPage(config)
      config.headers['x-access-token'] = storage.getSessionToken()
    return config

  responseError: (rejection) ->
    if rejection.data? and rejection.data.error? and (rejection.data.error.name == 'TokenExpiredError' || rejection.data.error.name == 'JsonWebTokenError')
      storage.clean()
      $injector.get('$state').go('login')
    else
      return $q.reject(rejection)
]