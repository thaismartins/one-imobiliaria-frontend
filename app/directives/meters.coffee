'use strict'

angular.module('oneImobiliaria')
.directive 'meters', ['$parse', ($parse) ->
  require: "?ngModel"
  scope:
    ngModel:'='
  restrict: 'A'
  link: ($scope, elem, attrs, ngModel) ->

    console.log(ngModel.$modelValue)
    formatter = (value) ->
      value = 0 if not value?
      value = value.toString().replace('m²', '')
      value = value.toString().replace(/\D/g, '')
      return value + 'm²'

    ngModel.$formatters.push (value) ->
      console.log(value)
      formatter(value)

    ngModel.$parsers.push (value) ->
      value.toString().replace('m²', '')

    changeHandler = () ->
      newValue = formatter(ngModel.$modelValue)

      console.log(newValue)
      $parse(attrs.ngModel).assign($scope, newValue);
      ngModel.$viewValue = newValue;
      ngModel.$render();

    elem.bind('keyup', changeHandler)
]