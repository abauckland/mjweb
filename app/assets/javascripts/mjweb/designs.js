// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		
	$('#design_background_id').ddslick({
		attribute_id: $(this).attr('id'),
	    attribute_name: $(this).attr('name'),
		width: 155,
		//ddslick.js has been altered directly to get correct dropdown sise and content
	});
	
	$('#design_font_id').ddslick({
		attribute_id: $(this).attr('id'),
	    attribute_name: $(this).attr('name'),
		width: 175,
		//ddslick.js has been altered directly to get correct dropdown sise and content
	});

});