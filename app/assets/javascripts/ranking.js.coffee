jQuery ->

  $ranking = $("#ranking")

  $delay    = (ms, func) -> setTimeout func, ms
  $interval = (ms, func) -> setInterval func, ms

  $refresh_ranking = ->
    $.ajax
      url: $ranking.data('url'),
      type: 'GET',
      dataType: 'script'

  $timer = $interval 500, ->
    if $ranking.data('dirty') == "yes"
      $refresh_ranking()
      $ranking.data('dirty', 'no')

