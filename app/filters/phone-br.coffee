'use strict';

angular.module('oneImobiliaria')
.filter 'phoneBr', () ->
  (input) ->
    return '' if not input?
    input = input.replace(/[^0-9]/g, "")

    if input.length < 11
        return input.replace(/(\d{2})(\d{4})(\d{4})/g,"(\$1) \$2-\$3")
    else
        return input.replace(/(\d{2})(\d{5})(\d{4})/g,"(\$1) \$2-\$3")