# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@number_of_items
@current_item=0
@initial_fade_in = 500
@fade_time = 1000
@item_interval = 2000
@image_class = '.cat'
jQuery ($) ->
  # image scroller
  $(window).load ->
    @number_of_items = $(@image_class).length
    find_next_item = ->
      if @current_item == @number_of_items - 1
        @current_item = 0
      else
        @current_item++
    find_prev_item = ->
      if @current_item == 0
        @current_item = @number_of_items - 1
      else
        @current_item--
    show_item = (prev=false) ->
        $(@image_class).eq(@current_item).fadeOut @fade_time
        unless prev
          find_next_item()
        else
          find_prev_item()
        $(@image_class).eq(@current_item).fadeIn @fade_time

    $(@image_class).eq(@current_item).fadeIn @initial_fade_in
    $('#next').click ->
      show_item()
    $('#prev').click ->
      show_item(true)
    setInterval(show_item, item_interval)

    # keep nav-bar fixed with scroll
    @nav = $('#nav')
    $(window).scroll ->
      if $(window).scrollTop() > 150
        @nav.removeClass('nav-abs').addClass('nav-fixed')
      if $(window).scrollTop() < 149
        @nav.removeClass('nav-fixed').addClass('nav-abs')
