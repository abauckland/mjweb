// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(window).ready(function() {	

$("input#detail_tile_colour").ColorPickerSliders({
                size: 'sm',
                placement: 'bottom',
                swatches: false,
                order: {
                    hsl: 1
                }
            });
});