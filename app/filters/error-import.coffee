'use strict'

angular.module('oneImobiliaria')
.filter 'errorImport', () ->
  (code) ->

    error = ''
    switch code
      when 1 then error = 'Este cliente já possui um imóvel cadastrado.'
      else error = 'Erro ao salvar item. Por favor, verifique o dados inseridos na tabela.'

    return error