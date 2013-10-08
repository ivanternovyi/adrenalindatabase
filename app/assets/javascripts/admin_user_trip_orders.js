$(document).ready(function(){
  $('form .remove_fields').on('click', function(evt){
    $(this).prev('input[type=hidden]').val(1);
    $(this).closest('div.payment_info').hide();
    $(this).closest('form').submit();
    evt.preventDefault();
  });

  $('form .add_payment_fields').on('click', function(evt){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $('input.carddatefield').datepicker({
    changeYear: true,
    yearRange: "-5:+5",
    dateFormat: 'dd-mm-yy'});
    evt.preventDefault();
  });
});