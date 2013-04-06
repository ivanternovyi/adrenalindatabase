# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.dynamic_container').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.phone-field').mask('+99 (999) 999-99-99')
    event.preventDefault()

  $('.phone-field').mask('+99 (999) 999-99-99')

  $.datepicker.setDefaults($.datepicker.regional['uk'])

  $('#user_user_detail_attributes_birthday').datepicker
    changeYear: true
    dateFormat: 'dd-mm-yy'