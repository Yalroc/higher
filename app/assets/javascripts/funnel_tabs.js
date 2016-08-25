$(document).ready(function() {
  $('.tabs').on('click', function() {
    var id = $(this).data('target')
    $('.tab-content').hide();
    $(id).show();
  })
})
