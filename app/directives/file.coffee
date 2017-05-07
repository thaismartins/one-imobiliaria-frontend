'use strict'

angular.module('oneImobiliaria')
.directive 'file', () ->
  require:"ngModel"
  restrict: 'A'
  link: ($scope, element, attrs, ngModel) ->

    changeHandler = (event) ->
      files = event.target.files
      file = files[0]

      fileReader = new FileReader()
      fileReader.readAsDataURL(file);
      fileReader.onload = (e) ->
        file.thumbnail = e.target.result
        ngModel.$setViewValue file
        $scope.$apply()

    element.bind('change', changeHandler)
    return