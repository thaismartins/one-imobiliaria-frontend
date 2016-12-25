'use strict'

angular.module('oneImobiliaria')
.directive 'meters', () ->
  require: "ngModel"
  restrict: 'A'
  link: ($scope, elem, attrs, ngModel) ->

    changeHandler = (event) ->
      console.log('Entrou')
      ngModel.$setViewValue('400m²')
      $scope.$apply()

    elem.bind('change', changeHandler)