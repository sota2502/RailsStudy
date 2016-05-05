# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.JS_toggle').click (evt) ->
    _self = $(this)
    id = _self.data('id')
    $.post('/follows/toggle/' + id)
    if _self.attr('value') == 'follow'
      label = 'unfollow'
    else
      label = 'follow'
    
    _self.attr('value', label)
    
