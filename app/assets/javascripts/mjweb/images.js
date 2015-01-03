// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		

	var select_width = 100;
	var select_height = 200;

	$('#imagesetting_image_id').ddslick({
		attribute_id: "imagesetting_image_id",
	    attribute_name: "imagesetting[image_id]",
		width: select_width,
		labelWidth: 80,
		selectText: "Select image...",
	});		
});