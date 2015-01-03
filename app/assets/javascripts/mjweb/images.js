// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		

	$('#imagesetting_image_id').ddslick({
		attribute_id: "imagesetting_image_id",
	    attribute_name: "imagesetting[image_id]",
		width: 85,
		height: 125,
		labelWidth: 80,
		selectHeight: 60
		selectText: "Select image...",
	});		
});