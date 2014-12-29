$(document.header).ready(function() {
  var url = window.location.pathname;
  var id = parseInt(url.substring(url.lastIndexOf('/') + 1));
  if (url == '/html_css/'+id) {
    $('.noactive-html').addClass('active-html');
  }
  if (url == '/javascript/'+id) {
    $('.noactive-js').addClass('active-js');
  }
  if (url == '/ruby/'+id) {
    $('.noactive-ruby').addClass('active-ruby');
  }
});

$(document).ready(function(){
  $('.search-btn').click(function(e) {
    $('.form-search-item').fadeToggle('slow');
    $("input:text:visible:first").focus(); // Autofocus on Input field
    e.stopPropagation();
  }); // Hide - Show
  
    $('.form-search-item').click(function(e){
    e.stopPropagation();
    }); // Stop the bubble to go outside
  
  $(document).click(function() {
    $('.form-search-item').fadeOut('slow');
  }); // Close the drop-down when clicking outside of it
  
  $(document).keyup(function(e) {
    if (e.keyCode === 27) {
      $('.form-search-item').fadeOut();
    }
  }); // Press ESC will also close the drop-down
});