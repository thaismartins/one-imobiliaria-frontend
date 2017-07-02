'use strict'

angular.module('oneImobiliaria')
.service 'sessionInjector', ['storage', '$injector', (storage, $injector) ->

  isUnloggedPage = (config) ->
    return (config.url.indexOf('auth') > -1 or config.url.indexOf('remember') > -1)

  request: (config)->
    if !isUnloggedPage(config)
      config.headers['x-access-token'] = storage.getSessionToken()
    return config

  responseError: (rejection) ->
    console.log(rejection.data);
    if not rejection.data? and not rejection.data.error? and rejection.data.error.name == 'TokenExpiredError'
      storage.clean()
      $injector.get('$state').go('login')
    else
      return rejection
]