
jQuery ->

  window.liveupdate_tracker = new PushStream(
    useSSL: 'https:' == document.location.protocol,
    urlPrefixStream: '/live-sub',
    urlPrefixEventsource: '/live-sub-ev',
    urlPrefixLongpolling: '/live-sub-lp',
    urlPrefixWebsocket: '/live-sub-ws'
  )
  window.liveupdate_tracker.onmessage = (text, id, channel)->
    switch channel
      when "em_game_updates"
        $data = JSON.parse text
        if $data.ended
          # body...
        else
          $.each $data['updates'], ->
            $game = $(this)
            $("#game_#{$game.game_id} .goals .goals_a .value").text $game.team_a
            $("#game_#{$game.game_id} .goals .goals_b .value").text $game.team_b
      when "em_score_updates"
        $("#ranking").data "dirty", "yes"

  window.liveupdate_tracker.addChannel 'em_game_updates'
  window.liveupdate_tracker.addChannel 'em_score_updates'
  window.liveupdate_tracker.connect()
