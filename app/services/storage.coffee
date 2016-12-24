'use strict'

angular.module('oneImobiliaria')
.service 'storage', () ->
  isLogged: () ->
    return (localStorage.getItem('x-code-one') != null) && (localStorage.getItem('code-one') != null)
  setCodes: (codes) ->
    localStorage.setItem('x-code-one', codes.session_key)
    localStorage.setItem('code-one', codes.id)
  getSessionToken: () ->
    localStorage.getItem('x-code-one')
  clean: () ->
    localStorage.removeItem('x-code-one')
    localStorage.removeItem('code-one')