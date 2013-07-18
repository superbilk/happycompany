# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#show_company").change ->
  $.ajax('/user/show_company',
    type: "PATCH",
    data: show_company: $(this).is(':checked')
  )
