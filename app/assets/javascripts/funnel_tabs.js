$(document).ready(function() {
  var params = getJsonFromUrl();

  $('.tab-content').hide();

  tab = params["tab"] || "resume";
  $('#' + tab).show();

  $('.tabs').on('click', function() {
    var id = $(this).data('target')
    $('.tab-content').hide();
    $(id).show();
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
