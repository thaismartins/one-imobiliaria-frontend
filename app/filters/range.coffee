'use strict'

angular.module('oneImobiliaria')
.filter 'range', () ->
  (n) ->
    res = []
    res.push(i) for i in [1...(n + 1)] by 1
    return res