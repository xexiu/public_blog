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
  if (url == '/void/'+id) {
    $('.noactive-void').addClass('active-void');
  }
});

$(document).ready(function(){
  $('.search-btn').click(function(e) {
    $('.form-search-item').fadeToggle('fast');
    $('.search-query').select();
    $("input:text:visible:first").focus(); // Autofocus on Input field
    e.stopPropagation();
  }); // Hide - Show
  
    $('.form-search-item').click(function(e){
    e.stopPropagation();
    }); // Stop the bubble to go outside
  
  $(document).click(function() {
    $('.form-search-item').fadeOut('fast');
  }); // Close the drop-down when clicking outside of it
  
  $(document).keyup(function(e) {
    if (e.keyCode === 27) {
      $('.form-search-item').fadeOut('fast');
    }
  }); // Press ESC will also close the drop-down
});

$(document).ready(function() {
   $('.mobile-button').click(function(e) {
       $('.mobile-menu').slideToggle('slow');
       e.stopPropagation();
   });
   
   $('.mobile-menu').click(function(e){
    e.stopPropagation();
    }); // Stop the bubble to go outside
   
   $(document).click(function() {
    $('.mobile-menu').slideUp('slow');
  }); // Close the drop-down when clicking outside of it
});

$(document).ready(function() {
    $('.all-tags').bind('keyup', function(e){
        var text = $(this);
        $(text).val($(text).val().toLowerCase().trim().replace(',', ' '));
        if(e.keyCode === 188){
          $(text).addClass('tag-link-form');
        } else {
          $(text).removeClass('tag-link-form');
        }
    });
});

$(document).ready(function() {
  $('.search-query').bind('railsAutocomplete.select', function(event, data) {
  $('.search-me').trigger('click');
  });
  
  
  
  data = []; 
  $('textarea').atwho({at:"@", 'data':data, insertTpl: '[@${name}](/users/${id})'}); 
});
