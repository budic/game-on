# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
    $('span.stars').stars();

$(document).ready ->
  
  #Convert address tags to google map links - Michael Jasper 2012
  $("address").each ->
    link = "<a href='http://maps.google.com/maps?q=" + encodeURIComponent($(this).text()) + "' target='_blank'>" + $(this).text() + "</a>"
    $(this).html link
    
$(document).ready ->
  $("addressmapx").each ->
    embed = "<iframe width='100%' height='300' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='http://maps.google.com/maps?&amp;q=" + encodeURIComponent($(this).text()) + "&amp;output=embed'></iframe>"
    $(this).html embed

