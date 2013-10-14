jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.dynamic_container').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    setListeners()
    event.preventDefault()

  setListeners()


setListeners = ->
  $('.phone-field').mask('+99 (999) 999-99-99')

  $.datepicker.setDefaults($.datepicker.regional['uk'])

  $('input.datefield').datepicker
    changeYear: true
    yearRange: "-100:+0"
    dateFormat: 'dd-mm-yy'

  $('input.carddatefield').datepicker
    changeYear: true
    yearRange: "-5:+5"
    dateFormat: 'dd-mm-yy'