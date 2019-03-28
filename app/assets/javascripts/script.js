$(document).on('turbolinks:load', function(){
	// turbolinksを発火させる為の記述$(document).on('turbolinks:load'
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

 });
