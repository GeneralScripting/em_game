
jQuery ->

  window.liveupdate_tracker = new PushStream(
    useSSL: 'https:' == document.location.protocol,
    urlPrefixStream: '/live-sub',
    urlPrefixEventsource: '/live-sub-ev',
    urlPrefixLongpolling: '/live-sub-lp',
    urlPrefixWebsocket: '/live-sub-ws'
  )
  window.liveupdate_tracker.onmessage = (text, id, channel)->
    $data = JSON.parse text
    console.log( $data )  if console
    $.each $data['updates'], ->
      $game = $(this)
      $("#game_#{$game.game_id} .goals .goals_a .value").text $game.team_a
      $("#game_#{$game.game_id} .goals .goals_b .value").text $game.team_b
  window.liveupdate_tracker.addChannel 'em_game_updates'
  window.liveupdate_tracker.connect()
