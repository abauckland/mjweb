// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		

	var select_width = 155;
	var select_height = 200;

	$('#imagesetting_image_id').ddslick({
		attribute_id: "imagesetting_image_id",
	    attribute_name: "imagesetting[image_id]",
		width: select_width,
		selectText: "Select image...",
	});
	
	$('#about_image_id').ddslick({
		attribute_id: "about_image_id",
	    attribute_name: "about[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});

	$('#bank_image_id').ddslick({
		attribute_id: "bank_image_id",
	    attribute_name: "bank[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#book_image_id').ddslick({
		attribute_id: "book_image_id",
	    attribute_name: "book[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#networking_image_id').ddslick({
		attribute_id: "networking_image_id",
	    attribute_name: "networking[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#product_image_id').ddslick({
		attribute_id: "product_image_id",
	    attribute_name: "product[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#service_image_id').ddslick({
		attribute_id: "service_image_id",
	    attribute_name: "service[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#training_image_id').ddslick({
		attribute_id: "training_image_id",
	    attribute_name: "training[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});	

	$('#webpage_image_id').ddslick({
		attribute_id: "webpage_image_id",
	    attribute_name: "webpage[image_id]",
		width: select_width,
		height: select_height,
		selectText: "Select image...",
	});			
});