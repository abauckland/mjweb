// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		

	$('#design_background_id').ddslick({
		attribute_id: "design_background_id",
	    attribute_name: "design[background_id]",
	    width: 180,
		//ddslick.js has been altered directly to get correct dropdown sise and content and provide parameters required by rails
	});
	
	$('#design_font_id').ddslick({
		attribute_id: "design_font_id",
	    attribute_name: "design[font_id]",
	    width: 180,
		//ddslick.js has been altered directly to get correct dropdown sise and content and provide parameters required by rails
	});

});