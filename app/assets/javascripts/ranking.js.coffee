jQuery ->

  $ranking = $("#ranking")

  $delay    = (ms, func) -> setTimeout func, ms
  $interval = (ms, func) -> setInterval func, ms

  $refresh_ranking = ->
    $.ajax
      url: $ranking.data('url'),
      type: 'GET',
      dataType: 'html',
      success: (data)->
        $ranking.find("ol").html data

  $timer = $interval 500, ->
    if $ranking.data('dirty') == "yes"
      $refresh_ranking()
      $ranking.data('dirty', 'no')

