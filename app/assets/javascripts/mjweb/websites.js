//NEW JQUERY
function InfiniteRotator(tile) {
			//initial fade-in time (in milliseconds)
			var initialFadeIn = 0;
			//interval between items (in milliseconds)
			var itemInterval = 3000;
			//cross-fade time (in milliseconds)
			var fadeTime = 1500;
			//count number of items
			var numberOfItems = tile.children('.rotating-item').length;
			//set current item
			var currentItem = 0;			
			//show first item
			tile.children('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);
			//loop through the items
			var infiniteLoop = setInterval(function(){
				tile.children('.rotating-item').eq(currentItem).fadeOut(fadeTime);

				if(currentItem == numberOfItems -1){
					currentItem = 0;
				}else{
					currentItem++;
				}
				tile.children('.rotating-item').eq(currentItem).fadeIn(fadeTime);
			}, itemInterval);
};




function roundDown(x) {
	//rounds number up to next number
	if (x < x.toFixed(0)) {
		var n = x.toFixed(0);
		x = +n - 1;
	}else{
		x = x.toFixed(0);
	}
	return x;
}



//function content_tiling(tile_name, container_name){
function feature_tiling(tile_frame, tile_container, tile, tile_id) {

	//total tiles		
	var n = $(tile).length;
	var content_tile_width = $(tile).outerWidth();
	var window_width = $(tile_frame).width(); 
	//number fit in width
	var max_tiles_in_row = window_width/content_tile_width;	
	var max_tiles_in_row_rounded = roundDown(max_tiles_in_row);
	
	if (max_tiles_in_row_rounded == 1){
		var margin = (window_width - content_tile_width)/2;
		var sub_margin = 0;
		$(tile_container).css('margin-left',margin+'px');
		$(tile).css('margin-left',sub_margin+'px');	
	}
	else
	{	
		//number of rows
		var number_of_rows = n/max_tiles_in_row_rounded;
		var number_of_rows_rounded = roundDown(number_of_rows);
		//number in left over (in last row)
		var number_last_row = (n - (number_of_rows_rounded * max_tiles_in_row_rounded));

		//width of content block
		var content_block_width = max_tiles_in_row_rounded * content_tile_width;
		
		var last_row_tile_ref = ((n-number_last_row));
	
		//set margins if wider than
		if (number_last_row == 0){
			var margin = (window_width - content_block_width)/2;
			var sub_margin = 0;
			
			$(tile_container).css('margin-left',margin+'px');
			$(tile).css('margin-left',sub_margin+'px');	
		}
		else
		{
			var margin = (window_width - content_block_width)/2;
			var sub_margin = (content_block_width - (number_last_row * content_tile_width))/2;
			var id = last_row_tile_ref;
			
			$(tile_container).css('margin-left',margin+'px');
			$(tile_id + id).css('margin-left',sub_margin+'px');	
		}
	}
}

//function content_tiling(tile_name, container_name){
function content_tiling() {

	//total tiles		
	var tile_width = $('.tile_container').outerWidth();
	var container = $('.container').width();
	var tiles_in_row = container/tile_width;
	var tiles_in_row_rounded = roundDown(tiles_in_row);	
	var total_tile_width = (tiles_in_row_rounded*tile_width);

	var margin = (container - total_tile_width)/2;
	$('.web_content').css('margin-left',margin+'px');


}

function background_image_1() {
	var body_height = $('body').outerHeight();
	
	$('.background_image_1').css('height',body_height+'px' );

}



$(document).ready(function(){

	background_image_1();
	$(window).resize(function(){
		background_image_1();
	});

	
	content_tiling();
	$(window).resize(function(){
		content_tiling();
	});
	
	//responsive layout of content
	var tile_frame = '.feature_tile';
	var tile = '.feature_tile_item';
	var tile_container = '.feature_tile_container';
	var tile_id = '#feature_tile_';	
	feature_tiling(tile_frame, tile_container, tile, tile_id);

	$(window).resize(function(){
		feature_tiling(tile_frame, tile_container, tile, tile_id);
	});



	$("div.help_tooltip").qtip({ // Grab some elements to apply the tooltip to
	
	    show: 'click',
	    hide: 'unfocus',
	    content: {
	        text: function(event, api) {
	                
	            $.ajax({
	                url: 'http://www.myhq.org.uk/helps/'+$(this).attr('id'),
	                type: 'GET', // POST or GET
	                dataType: 'html',
	            })
	            .then(function(content) {
	                // Now we set the content manually (required!)
	                api.set('content.text', content);
	            }, function(xhr, status, error) {
	                // Upon failure... set the tooltip content to the status and error value
	                api.set('content.text', status + ': ' + error);
	            });
	            return 'Loading...';
	       }
	    },
	        position: {
	        my: 'top center',  // Position my top left...
	        at: 'bottom center', // at the bottom right of...
	    }
	})


	$("div.help_tooltip").dblclick(function (){
	// redirect to edit tip content
	        window.location = 'http://www.myhq.org.uk/helps/'+$(this).attr('id')+'/edit';
	        return false;
	});




	$(".multiple_images_tile").each(function(){
		InfiniteRotator($(this));
	});

});
