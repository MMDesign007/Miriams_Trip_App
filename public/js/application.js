$(document).ready(function() {

  $("#review-link").on("click", function(event){
    event.preventDefault();
    console.log("click-click");
    link = $(this).attr('href');

//match type and url to controller
    var request = $.ajax ({
      type: "get",
      url: link,
      data: $(this).serialize
    })

    request.done(function(response){
      $('.container').append(response)
    })
  });


});