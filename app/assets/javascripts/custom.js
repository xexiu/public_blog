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