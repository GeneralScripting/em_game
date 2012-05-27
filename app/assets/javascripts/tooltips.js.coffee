
jQuery ->
  #$('a[title], span[title]').tipsy({fade: true, gravity: 'n', live:true, hoverlock:false })
  $('a[title], span[title]').livequery ->
    $(this).tipsy
      fade: true,
      gravity: 'n',
      html: true