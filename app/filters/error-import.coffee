'use strict'

angular.module('oneImobiliaria')
.filter 'errorImport', () ->
  (code, fields) ->

    error = ''
    switch code
      when 1 then error = 'Este cliente já possui um imóvel cadastrado.'
      when 5 then error = 'Erro(s) no(s) campo(s) de cliente: ' + fields + '.'
      when 6 then error = 'Erro(s) no(s) campo(s) de imóvel: ' + fields + '.'
      else error = 'Erro ao salvar item. Por favor, verifique o dados inseridos na tabela.'

    return error