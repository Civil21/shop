# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $("#sort_line").on 'click', '.sort', (event) ->
    console.log(event.target.id)
    $.ajax
      url: '/sort'
      type: 'GET'
      dataType: 'script'
      data: {
        name: event.target.id
      }
