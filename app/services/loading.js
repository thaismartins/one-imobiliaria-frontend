'use strict';

angular.module('oneImobiliaria')
.service('loading', ['$rootScope', function($rootScope) {
  return {
    show: function() {
      return $rootScope.loading = true;
    },
    hide: function() {
      return $rootScope.loading = false;
    }
  };
}]);