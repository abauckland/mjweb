//NEW JQUERY

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
function content_tiling() {

	//total tiles		
	var tile_width = $('.tile_container').outerWidth();
	var container = $('.container').width();
	var tiles_in_row = container/tile_width;
	var tiles_in_row_rounded = roundDown(tiles_in_row);	
	var total_tile_width = (tiles_in_row_rounded*tile_width);

	var margin = (container - total_tile_width)/2;
	$('.content').css('margin-left',margin+'px');


}

$(document).ready(function(){
	
	content_tiling();
	$(window).resize(function(){
		content_tiling();
	});
	
});



$(window).load(function() {	//start after HTML, images have loaded

	var InfiniteRotator =
	{
		init: function()
		{
			//initial fade-in time (in milliseconds)
			var initialFadeIn = 0;

			//interval between items (in milliseconds)
			var itemInterval = 4000;

			//cross-fade time (in milliseconds)
			var fadeTime = 1500;

			//count number of items
			var numberOfItems = $('.rotating-item').length;

			//set current item
			var currentItem = 0;

			//show first item
			$('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);

			//loop through the items
			var infiniteLoop = setInterval(function(){
				$('.rotating-item').eq(currentItem).fadeOut(fadeTime);

				if(currentItem == numberOfItems -1){
					currentItem = 0;
				}else{
					currentItem++;
				}
				$('.rotating-item').eq(currentItem).fadeIn(fadeTime);

			}, itemInterval);
		}
	};

	InfiniteRotator.init();

});



​