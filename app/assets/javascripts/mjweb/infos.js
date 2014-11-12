// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		
	$('#info_image_id').ddslick({
		attribute_id: "info_image_id",
	    attribute_name: "info[image_id]",
		width: 50,
		//ddslick.js has been altered directly to get correct dropdown sise and content and provide parameters required by rails
	});

$('select#info_link_page_id').attr('disabled', 'disabled');

$('input#url_custom_url').click(function (){
	$('input#page_id_page_url').prop('checked', false);
	$('input#info_link_url').removeAttr('disabled');
	$('select#info_link_page_id').attr('disabled', 'disabled').val('');
});

$('input#page_id_page_url').click(function (){
	$('input#url_custom_url').prop('checked', false);
	$('input#info_link_url').attr('disabled', 'disabled').val('');
	$('select#info_link_page_id').removeAttr('disabled');
});



});