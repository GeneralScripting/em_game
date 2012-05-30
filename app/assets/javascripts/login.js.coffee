# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> 
  $('#invite_friends').click ->
    FB.ui {method: 'apprequests', message: 'My Great Request', }, (response)->
      $.ajax
        url: $('body').data('invitation-url'),
        type: 'POST',
        data: { request_id: response.request, invited_users: response.to },
        dataType: 'script'
    return false