$(document.header).ready(function(){var t=window.location.pathname,e=parseInt(t.substring(t.lastIndexOf("/")+1));t=="/html_css/"+e&&$(".noactive-html").addClass("active-html"),t=="/javascript/"+e&&$(".noactive-js").addClass("active-js"),t=="/ruby/"+e&&$(".noactive-ruby").addClass("active-ruby"),t=="/void/"+e&&$(".noactive-void").addClass("active-void")}),$(document).ready(function(){$(".search-btn").click(function(t){$(".form-search-item").fadeToggle("fast"),$(".search-query").select(),$("input:text:visible:first").focus(),t.stopPropagation()}),$(".form-search-item").click(function(t){t.stopPropagation()}),$(document).click(function(){$(".form-search-item").fadeOut("fast")}),$(document).keyup(function(t){27===t.keyCode&&$(".form-search-item").fadeOut("fast")})}),$(document).ready(function(){$(".mobile-button").click(function(t){$(".mobile-menu").slideToggle("slow"),t.stopPropagation()}),$(".mobile-menu").click(function(t){t.stopPropagation()}),$(document).click(function(){$(".mobile-menu").slideUp("slow")})}),$(document).ready(function(){$(".all-tags").bind("keyup",function(t){var e=$(this);$(e).val($(e).val().toLowerCase().trim().replace(","," ")),188===t.keyCode?$(e).addClass("tag-link-form"):$(e).removeClass("tag-link-form")})}),$(document).ready(function(){$(".search-query").bind("railsAutocomplete.select",function(){$(".search-me").trigger("click")}),data=[],$("textarea").atwho({at:"@",data:data,insertTpl:"[@${name}](/users/${id})"})});