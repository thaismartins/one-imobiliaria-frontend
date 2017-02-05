'use strict'

angular.module('oneImobiliaria')
.directive 'file', ['$parse', '$timeout', ($parse, $timeout) ->
  require: "ngModel"
  restrict: 'A'
  link: ($scope, elem, attrs, ngModel) ->

    fn = $parse(attrs['ngFileSelected'])
    changeHandler = (event) ->
      files = event.target.files
      file = files[0]

      $timeout () ->
        fn $scope,
          $file: file,
          $event: event

    elem.bind('change', changeHandler)

]