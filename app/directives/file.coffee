'use strict'

angular.module('oneImobiliaria')
.directive 'file', () ->
  require: "ngModel"
  restrict: 'A'
  link: ($scope, elem, attrs, ngModel) ->

    changeHandler = (event) ->
      files = event.target.files
      file = files[0]

      ngModel.$setViewValue(file)
      $scope.$apply()

    elem.bind('change', changeHandler)