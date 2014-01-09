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
          // TODO: put some real code here...
          alert("Woops, try again!");
        }
      });
      return false; // prevents normal behavior, i.e. AJAX only
  });

});