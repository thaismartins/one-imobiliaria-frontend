'use strict'

angular.module('oneImobiliaria')
.directive 'file', ['$parse', '$timeout', ($parse, $timeout) ->
  require:"ngModel"
  restrict: 'A'
  link: ($scope, element, attrs, ngModel) ->

    changeHandler = (event) ->
      files = event.target.files
      file = files[0]

      if typeof attrs['ngFileSelected'] == 'undefined'
        fileReader = new FileReader()
        fileReader.readAsDataURL(file);
        fileReader.onload = (e) ->
          file.thumbnail = e.target.result
          ngModel.$setViewValue file
          $scope.$apply()
      else
        fn = $parse(attrs['ngFileSelected'])
        $timeout () ->
          fn $scope,
            $file: file,
            $event: event

    element.bind('change', changeHandler)
]