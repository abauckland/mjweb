// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function ($) {		
	$('#linktile_icon_id').ddslick({
		attribute_id: "linktile_icon_id",
	    attribute_name: "linktile[icon_id]",
		width: 85,
		height: 125,
		labelWidth: 80
		//ddslick.js has been altered directly to get correct dropdown sise and content and provide parameters required by rails
	});
	
});