'use strict'

angular.module('oneImobiliaria')
.service 'storage', () ->
  isLogged: () ->
    return (localStorage.getItem('x-code-one') != null) && (localStorage.getItem('code-one') != null)
  setCodes: (codes) ->
    localStorage.setItem('x-code-one', codes.token)
    localStorage.setItem('code-one', codes.code)
    localStorage.setItem('group-one', codes.type)
    localStorage.setItem('name-one', codes.name)
  getSessionToken: () ->
    localStorage.getItem('x-code-one')
  clean: () ->
    localStorage.removeItem('x-code-one')
    localStorage.removeItem('code-one')
    localStorage.removeItem('group-one')
    localStorage.removeItem('name-one')