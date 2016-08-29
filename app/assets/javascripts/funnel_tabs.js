
$(document).ready(function() {
  // switch tabs #job, #resume, & #cover-letter
  var params = getJsonFromUrl();

  $('.tab-content').hide();

  tab = ( params["tab"] || "resume" );
  $('#' + tab).show();

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
