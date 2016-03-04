# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  i = 1
  $("#cat#{i}").toggle()
  nextP = ->
    $("#cat#{i}").toggle()
    if i<3
      i++
    else
      i=1
    $("#cat#{i}").toggle()
  prevP = ->
      $("#cat#{i}").toggle()
      if i>1
        i--
      else
        i=3
      $("#cat#{i}").toggle()

  $("#next").click(nextP)
  $("#prev").click(prevP)
