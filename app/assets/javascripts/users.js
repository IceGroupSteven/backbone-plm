// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('form').submit(function() {
      var valuesToSubmit = $(this).serialize();
      $.ajax({
        url: $(this).attr('action'), //sumbits it to the given url of the form
        type: "POST",
        dataType: "HTML",
        data: valuesToSubmit,
        success: function(data) {
          // Attach the data HTML to the DOM body
          $('div.container').prepend(data);
          $('#myModal').modal('show');
        },
        // If something went wrong... meaning the controller/app doesn't return HTML data type, basically, I think?
        error: function(responseObject) {
          // Fires after a failure response is received, i.e. if the response has a 400 or 500 HTTP status code
          $('.register-form-signup').append(responseObject.responseText);
          $('.errors').delay(4000).hide('slow');
        }
      });
      return false; // prevents normal behavior, i.e. AJAX only
  });

});
