/* global $ */
// Wait until the whole page loads
$(document).on('turbolinks:load', function(){
  $('.alert').delay(800).fadeOut(2500);
});