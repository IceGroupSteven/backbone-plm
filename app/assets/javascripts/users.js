// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('form').submit(function() {
      var valuesToSubmit = $(this).serialize();
      $.ajax({
        url: $(this).attr('action'), //sumbits it to the given url of the form
        dataType: "JSON", // you want a difference between normal and ajax-calls, and json is standard
        type: "POST",
        data: valuesToSubmit,
        success: function(json) {
          alert(json);
          // What do I want to do with the JSON that is returned? Pass it into the questionnaire?
        },
        // If something went wrong...
        error: function(responseObject) {
          alert(responseObject.responseText);
        }
      });
      // NOTE: This 'return false' may be preventing modal opening...
      return false; // prevents normal behaviour
  });

  $('#myModal').modal('hide');
  $('button[data-target="#myModal"]').click(function() {
      //$('form').submit();
      $('#myModal').modal('show');
  });

});