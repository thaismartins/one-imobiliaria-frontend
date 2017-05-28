'use strict'

angular.module('oneImobiliaria')
.filter 'excerpt', () ->
  (text) ->

    return '' if not text? or text == ''

    if text.length < 101
      return text

    text = text.substr(0, 100)
    text = text.split(' ')

    excerpt = []
    for string, id in text
      excerpt.push string if id < (text.length - 1)

    return excerpt.join(' ') + '...'