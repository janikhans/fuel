# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#spots').imagesLoaded ->
		$('#spots').masonry
			itemSelector: '.box'
			isFitWidth: true

$ ->
	$('#spots').imagesLoaded ->
    $('#spots').masonry
      itemSelector: '.box'
      columnWidth: 3
      isFitWidth: true
      isAnimated:true
      animationOptions: {
        duration: 700,
        easing:'linear',
        queue :false
 			}