// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
    jQuery(document).ready(function ($) {
		
		$('.text_count').keyup(function() {
			
		  var text_max = $(this).attr('maxLength')			
		  var text_length = $(this).val().length;
		  var text_remaining = text_max - text_length;
		  
		  $(this).parent('.form-group').children('#count_message').html(text_remaining + ' characters remaining');
		  
		  if(text_remaining == 0){
		  	$('#count_message').css('color', 'red');
		  }else{
		  	$('#count_message').css('color', 'black');
		  }
		  
		});
    });