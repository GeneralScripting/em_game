
jQuery ->

  $("a.fancy").livequery ->
    options = $(this).data('colorboxoptions') || {}
    colorbox_options = $.extend({ scrolling:false, initialWidth:'50%', initialHeight:'50%', maxHeight:'95%', maxWidth:'95%' }, options)
    $(this).colorbox colorbox_options
