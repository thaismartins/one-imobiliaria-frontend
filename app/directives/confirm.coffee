'use strict'

angular.module('oneImobiliaria')
.directive 'ngConfirmClick', () ->
  priority: -1
  restrict: 'A'
  link: (scope, element, attrs) ->
    message = attrs.ngConfirmClick
    element.bind 'click', (e) ->
      if message? and !confirm(message)
        e.stopImmediatePropagation()
        e.preventDefault()