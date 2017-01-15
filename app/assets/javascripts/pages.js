/* global $ */
// Wait until the whole page loads
$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(2500);
});