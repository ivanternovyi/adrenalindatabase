$(document).ready(function(){
  $('form .remove_fields').on('click', function(evt){
    $(this).prev('input[type=hidden]').val(1);
    $(this).closest('div.payment_info').hide();
    $(this).closest('form').submit();
    evt.preventDefault();
  });
});