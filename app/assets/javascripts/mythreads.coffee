# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.js-toggle').click (e) ->
    element = $(this)
    id = element.data('id')
    $.post('/follows/toggle/' + id)
    if element.attr('value') == 'follow'
      label = 'unfollow'
    else
      label = 'follow'
    
    element.attr('value', label)
    
