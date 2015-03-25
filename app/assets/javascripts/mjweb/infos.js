// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		

	$('#info_image_id').ddslick({
		attribute_id: "info_image_id",
	    attribute_name: "info[image_id]",
		width: 85,
		height: 125,
		labelWidth: 80,
		selectHeight: 60
		//ddslick.js has been altered directly to get correct dropdown sise and content and provide parameters required by rails
	});


//	if ($('input#info_link_type_1').is(':checked')) {
//		$('input#info_link_text').attr('disabled', 'disabled');
//		$('input#info_link_url').attr('disabled', 'disabled');
//		$('select#info_link_page_id').attr('disabled', 'disabled');
//	};

//	if ($('input#info_link_type_2').is(':checked')) {
//		$('input#info_link_url').attr('disabled', 'disabled');
//	};

//	if ($('input#info_link_type_3').is(':checked')) {
//		$('select#info_link_page_id').attr('disabled', 'disabled');
//	};

	$('input#info_link_type_1').click(function (){
		$('input#info_link_type_2').prop('checked', false);
		$('input#info_link_type_3').prop('checked', false);
		$('select#info_link_page_id').attr('disabled', 'disabled').val('');
		$('input#info_link_url').attr('disabled', 'disabled').val('');
		$('input#info_link_text').attr('disabled', 'disabled').val('');
	});
	
	$('input#info_link_type_2').click(function (){
		$('input#info_link_type_1').prop('checked', false);
		$('input#info_link_type_3').prop('checked', false);
		$('input#info_link_url').removeAttr('disabled');
		$('input#info_link_text').removeAttr('disabled');
		$('select#info_link_page_id').attr('disabled', 'disabled').val('');
	});
	
	$('input#info_link_type_3').click(function (){
		$('input#info_link_type_1').prop('checked', false);
		$('input#info_link_type_2').prop('checked', false);
		$('input#info_link_text').removeAttr('disabled');
		$('input#info_link_url').attr('disabled', 'disabled').val('');
		$('select#info_link_page_id').removeAttr('disabled');
	});

	$('#info_text').keyup(function () {
	  var max = 500;
	  var len = $(this).val().length;
	  if (len >= max) {
	    $('.character_count').text(' you have reached the limit').css('color','red');
	  } else {
	    var char = max - len;
	    $('.character_count').text(char + ' characters left').css('color','green');
	  }
	});

});