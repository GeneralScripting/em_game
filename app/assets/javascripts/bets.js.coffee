# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $("#new_bet, form.edit_bet").live "ajax:beforeSend", ->
    $('#cboxLoadedContent').hide()
    $('#cboxLoadingOverlay').show()
