# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
   $('#yesimage').hover(
        () -> $('#yespopup').fadeIn("fast")
        () -> $('#yespopup').fadeOut("fast")
    )
    
$ ->
    $('#noimage').hover(
        () -> $('#nopopup').fadeIn("fast")
        () -> $('#nopopup').fadeOut("fast")
    )
    
$ ->
   $('#maybeimage').hover(
        () -> $('#maybepopup').fadeIn("fast")
        () -> $('#maybepopup').fadeOut("fast")
    )

$ ->
   $('#comment_toggle').click(
        () -> $('#comment-box').slideToggle()
    )
    

    
