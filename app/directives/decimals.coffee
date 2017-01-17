'use strict'

angular.module('oneImobiliaria')
.directive 'decimals', ['$parse', ($parse) ->
  require: "?ngModel"
  scope:
    ngModel:'='
  restrict: 'A'
  link: ($scope, elem, attrs, ngModel) ->

    formatter = (value) ->
      return '' if not value?
      return value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")

    ngModel.$formatters.push (value) ->
      formatter(value)

    ngModel.$parsers.push (value) ->
      formatter(value)

    changeHandler = () ->
      newValue = formatter(ngModel.$modelValue)

      $parse(attrs.ngModel).assign($scope, newValue);
      ngModel.$viewValue = newValue;
      ngModel.$render();

    elem.bind('keyup', changeHandler)
]