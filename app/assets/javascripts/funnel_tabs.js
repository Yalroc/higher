
$(document).ready(function() {
  // switch tabs #job, #resume, & #cover-letter
  var params = getJsonFromUrl();

  // empty everything
  $('.tab-content').hide();
  $('.tabs').find(".circle").removeClass("active-funnel-steps");

  // find which tab we are on
  tab = ( params["tab"] || "resume" );
  $('#' + tab).show(); // show tab we want to see

  if ( params["modal"] ) {
    $("#ViewAsEmployerModal").modal("show");
  }

  // something like this =>
  var circle = 2
    if (tab == 'cover-letter') {
     circle = 3
    }

  // insert var instead of 2 below
  $('.tabs').find(".circle").find(".circle-numbers:contains(" + circle + ")").parent().addClass("active-funnel-steps"); // show circle of resume


  $('.tabs').on('click', function() {
    var id = $(this).data('target')
    $('.tab-content').hide();
    $(id).show();
    $('.tabs').find(".circle").removeClass("active-funnel-steps");
    $(this).find(".circle").addClass("active-funnel-steps");
  })


})

function getJsonFromUrl() {
  var query = location.search.substr(1);
  var result = {};
  query.split("&").forEach(function(part) {
    var item = part.split("=");
    result[item[0]] = decodeURIComponent(item[1]);
  });
  return result;
}



 // $(".tab").on("click", function(e){
 //    // Change active tab
 //    $(".tab").removeClass("active");
 //    $(this).addClass("active");
