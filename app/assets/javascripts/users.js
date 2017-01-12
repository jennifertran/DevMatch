/* global $, Stripe */ // <-- Says jQuery is defined somewhere else
// Document Key
$(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-signup-btn');
  // Set Stripe key
  Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content')) ;
  
  // Listen for a click in the submit button, prevent submission behaviour
  submitBtn.click(function(event){
    event.preventDefault();
  });
  
  // Collect the info in credit card fields
  var ccNum = $('#card_number').val(),
    cvcNum = $('#card_code').val(),
    expMonth = $('#card_month').val(),
    expYear = $('#card_year').val();
    
  // Send card info to stripe which will then return a token
  Stripe.createToken({
      number: ccNum,
      cvc: cvcNum,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler);

  // Inject the card token as a hidden field into the form
  
  // Then submit the form to our rails app 
  function stripeResponseHandler(){
    
  }
});
