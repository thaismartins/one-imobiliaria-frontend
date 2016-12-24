'use strict';

angular.module('oneImobiliaria')
.filter 'phoneBr', () ->
  (input) ->
    return '' if not input?

    if input.length == 10
        return input.replace(/(\d{2})(\d{4})(\d{4})/g,"(\$1) \$2-\$3")
    else
        return input.replace(/(\d{2})(\d{5})(\d{4})/g,"(\$1) \$2-\$3")