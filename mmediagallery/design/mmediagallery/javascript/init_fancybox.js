$(document).ready(function() {

	/* This is basic - uses default settings */

function formatTitle(title, currentArray, currentIndex, currentOpts) {
    return '<div class="caption">\n\
            <span><a href="javascript:;" onclick="$.fancybox.close();">\n\
            Chiudi </a></span>' + (title && title.length ? '<b>' + title + '</b>' : '' ) +'</div>';
}

	$("a.embedded-image").fancybox({
		'transitionIn'	:	'fade',
		'transitionOut'	:	'fade',
		'speedIn'		:	600,
		'speedOut'		:	200,
		'overlayShow'	:	true,
                'autoScale':true,
                'titlePosition':'over',
               'showCloseButton':false,
               'titleFormat':formatTitle
                
	});

});
