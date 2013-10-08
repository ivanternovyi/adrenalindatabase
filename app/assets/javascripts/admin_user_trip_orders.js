$(document).ready(function(){
  payment_remove_fields();
  payment_add_fields();

  $('#create-trip-for-user').on('click', function(evt){
    if($('body div#dark-plate')){
      var div_width = 300;
      var div_height = 150;
      var doc_width = $(document).width();
      var doc_height = $(document).height();
      var pos_x = Math.round((doc_width - div_width) / 2);
      var pos_y = Math.round((doc_height - div_height) / 2);
      
      $('body').append('<div id="dark-plate"></div>');
      $('div#dark-plate').css({
        position: 'absolute',
        width: doc_width.toString() + 'px',
        height: doc_height.toString() + 'px',
        backgroundColor: '#000',
        top: '0px',
        left: '0px',
        opacity: '0.8'
      });
      $('body div#dark-plate').on('click', function(event){
        $('body div#dark-plate').remove();
        $('body div#popup-window').remove();
      });

      $('body').append('<div id="popup-window">Hi</div>');
      $('div#popup-window').css({
        width: div_width.toString() + 'px',
        height: div_height.toString() + 'px',
        backgroundColor: '#FFF',
        position: 'absolute',
        left: pos_x.toString() + 'px',
        top: pos_y.toString() + 'px',
        borderRadius: '5px'
      });
    }
  });

});

var payment_remove_fields = function(){
  $('.remove_fields').on('click', function(evt){
    $(this).prev('input[type=hidden]').val(1);
    var old_element = $(this).closest('div.payment_info');
    $(this).closest('form').submit();
    old_element.hide();
    old_element.empty();
    old_element.remove();
    evt.preventDefault();
  });
}

var payment_add_fields = function(){
  $('.add_payment_fields').on('click', function(evt){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $('input.carddatefield').datepicker({
    changeYear: true,
    yearRange: "-5:+5",
    dateFormat: 'dd-mm-yy'});
    evt.preventDefault();
  });
}