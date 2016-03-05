# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  # console.log @number_of_items
jQuery ($) ->
  timer = 0
  number_of_items = 0
  current_item = 0
  started=false
  initial_fade_in = 500
  fade_time = 1000
  item_interval = 2000
  image_class = '.eng'
  $(document).on 'page:before-change', ->
    stop_cycle()

  $(document).on 'page:change', ->
    number_of_items = $(image_class).length
    if number_of_items > 0
      start_cycle()
    else
      stop_cycle()
    # start_cycle()


  find_next_item = ->
    if current_item == number_of_items - 1
      current_item = 0
    else
      current_item++


  find_prev_item = ->
    if current_item == 0
      current_item = number_of_items - 1
    else
      current_item--


  hightlight_thumb = ->
    if (number_of_items > current_item)
      image_id = $(image_class).eq(current_item).attr('id')
      thumb_id = "thumb_" + image_id.charAt(image_id.length - 1)
      $('#'+ thumb_id).addClass('bordered-thumb')


  de_hightlight_thumb = ->
    if (number_of_items > current_item)
      image_id = $(image_class).eq(current_item).attr('id')
      thumb_id = "thumb_" + image_id.charAt(image_id.length - 1)
      $('#'+ thumb_id).removeClass('bordered-thumb')


  show_item = (prev=false) ->
    de_hightlight_thumb()
    $(image_class).eq(current_item).fadeOut fade_time
    unless prev
      find_next_item()
      hightlight_thumb()
    else
      find_prev_item()
      hightlight_thumb()
    $(image_class).eq(current_item).fadeIn fade_time


  show_first = ->
    if current_item != 0
      $(image_class).eq(current_item).fadeOut fade_time
    current_item = 0;
    hightlight_thumb()
    $(image_class).eq(current_item).fadeIn initial_fade_in


  $('#next').click ->
    show_item()


  $('#prev').click ->
    show_item(true)


    # don't use () on show_item, unless you want to use the parameter
    # window.clearInterval(my_timer)
  start_cycle = ->
    show_first()
    timer = setInterval(show_item, item_interval)
    started=true


  stop_cycle = ->
    if started
      de_hightlight_thumb()
      show_first()
      clearInterval(timer)

  $(document).on 'page:change', ->

    $(window).scroll ->
      if ($(window).scrollTop() > 80)
        $('#nav').removeClass('nav-abs').addClass('nav-fixed')
        $('#logo-small').removeClass('logo-hide').addClass('logo-show')
      if $(window).scrollTop() < 79
        $('#nav').removeClass('nav-fixed').addClass('nav-abs')
        $('#logo-small').removeClass('logo-show').addClass('logo-hide')


# jQuery ($) ->
#   $(document).ready ->
#     console.log $('#eng1').height()
#     # $('.engis').attr('height', $('#eng1').height() )
