# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
   $('#mapbutton').on "click", (e) ->
    (
      e.preventDefault()
      $this = $(this)
      $this.hide()
      $collapse = $this.closest(".collapse-group").find(".collapse")
      $collapse.collapse "toggle"
      
      $("addressmap").each ->
      embed = "<iframe width='100%' height='300' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='http://maps.google.com/maps?&amp;q=" + encodeURIComponent($("addressmap").text()) + "&amp;output=embed'></iframe>"
      $("addressmap").html embed
      
    )
