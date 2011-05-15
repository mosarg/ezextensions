$(document).ready(function() {

     var images_number=$('#gallery_data p[title="images_number"]').text();
   
    //var formats=jQuery.parseJSON($('#page_elements p[title="formats"]').text());

    $('div.navigation').css({
        'width' : '300px',
        'float' : 'left'
    });
    $('div.content').css('display', 'block');

    // Initially set opacity on thumbs and add
    // additional styling for hover effect on thumbs
    var onMouseOutOpacity = 0.67;
    $('#thumbs ul.thumbs li').opacityrollover({
        mouseOutOpacity:   onMouseOutOpacity,
        mouseOverOpacity:  1.0,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    });
    
    
    var gallery = $('#thumbs').galleriffic({
        imagesNumber:images_number,
        delay:                     3000, // in milliseconds
        numThumbs:                 15, // The number of thumbnails to show page
        preloadAhead:              40, // Set to -1 to preload all images
        enableTopPager:            true,
        enableBottomPager:         true,
        maxPagesToShow:            7,  // The maximum number of pages to display in either the top or bottom pager
        imageContainerSel:         '#slideshow', // The CSS selector for the element within which the main slideshow image should be rendered
        controlsContainerSel:      '#controls', // The CSS selector for the element within which the slideshow controls should be rendered
        captionContainerSel:       '#caption', // The CSS selector for the element within which the captions should be rendered
        loadingContainerSel:       '#loading', // The CSS selector for the element within which should be shown when an image is loading
        renderSSControls:          true, // Specifies whether the slideshow's Play and Pause links should be rendered
        renderNavControls:         true, // Specifies whether the slideshow's Next and Previous links should be rendered
        playLinkText:              'Riproduci',
        pauseLinkText:             'Pausa',
        prevLinkText:              'Precedente',
        nextLinkText:              'Seguente',
        nextPageLinkText:          'Seguente &rsaquo;',
        prevPageLinkText:          '&lsaquo; Precedente',
        enableHistory:             false, // Specifies whether the url's hash and the browser's history cache should update when the current slideshow image changes
        enableKeyboardNavigation:  true, // Specifies whether keyboard navigation is enabled
        autoStart:                 false, // Specifies whether the slideshow should be playing or paused when the page first loads
        syncTransitions:           false, // Specifies whether the out and in transitions occur simultaneously or distinctly
        defaultTransitionDuration: 1000, // If using the default transitions, specifies the duration of the transitions
        onSlideChange:             function(){
        //alert($('div.slideshow img').outerHeight());
        },
        onTransitionOut:            undefined, // accepts a delegate like such: function(slide, caption, isSync, callback) { ... }
        onTransitionIn:            function(slide, caption, isSync) {
            var $page=$('#page');
            var $main=$('#main');
            var $footer=$('#footer');
            var page_height=$page.height();
            var $image=slide.find('img');
            var image_height=$image.outerHeight();
            var image_offset=$image.offset().top;

            var new_page_height=0;
           
            if(image_height+image_offset>page_height-50){
                  $main.height(image_height+$footer.height()+image_offset);

               $main.find('.class-gallery').height(image_height+$footer.height());
             }
            caption.parent().offset({top:image_height+image_offset+20});

            slide.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0);
            if (caption) caption.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0);


        }, // accepts a delegate like such: function(slide, caption, isSync) { ... }
        onPageTransitionOut:       undefined, // accepts a delegate like such: function(callback) { ... }
        onPageTransitionIn:        undefined, // accepts a delegate like such: function() { ... }
        onImageAdded:              undefined, // accepts a delegate like such: function(imageData, $li) { ... }
        onImageRemoved:            undefined  // accepts a delegate like such: function(imageData, $li) { ... }
    });



	

});
