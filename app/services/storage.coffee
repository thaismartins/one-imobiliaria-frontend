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
    localStorage.setItem('photo-one', codes.photo)
  setPhoto: (photo) ->
    localStorage.setItem('photo-one', photo)
  updateToken: (token) ->
    localStorage.setItem('x-code-one', token)
  getSessionToken: () ->
    localStorage.getItem('x-code-one')
  getCode: () ->
    localStorage.getItem('code-one')
  getName: () ->
    localStorage.getItem('name-one') || ''
  getGroup: () ->
    localStorage.getItem('group-one') || ''
  getPhoto: () ->
    return false if localStorage.getItem('photo-one') == 'undefined'
    localStorage.getItem('photo-one')
  clean: () ->
    localStorage.removeItem('x-code-one')
    localStorage.removeItem('code-one')
    localStorage.removeItem('group-one')
    localStorage.removeItem('name-one')