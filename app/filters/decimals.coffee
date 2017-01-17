'use strict'

angular.module('oneImobiliaria')
.filter 'decimals', () ->
  (num) ->

    return '' if not num?

    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")