jQuery ->

  $delay = (ms, func) -> setTimeout func, ms

  $test_case_timer = (elem) ->
    $timer = elem
    if $timer.length > 0
      $seconds_left = parseInt($timer.data('timeleft'), 10)
      if $seconds_left > 0
        $timer.data('timeleft', $seconds_left-1)
        $delay 1000, -> $test_case_timer $timer
        $timer.trigger "time_running_out" if $seconds_left < 120
        $timer_text = ""
        if $seconds_left >= 31536000
          $years = Math.floor($seconds_left/31536000)
          $seconds_left = $seconds_left - ($years * 31536000)
          $timer_text += $years + "y "
        if $seconds_left >= 86400
          $days = Math.floor($seconds_left/86400)
          $seconds_left = $seconds_left - ($days * 86400)
          $timer_text += $days + "d "
        if $seconds_left >= 3600
          $hours = Math.floor($seconds_left/3600)
          $seconds_left = $seconds_left - ($hours * 3600)
          $timer_text += $hours + "h "
        if $seconds_left >= 60
          $minutes = Math.floor($seconds_left/60)
          $seconds_left = $seconds_left - ($minutes * 60)
          $timer_text += (if $minutes > 9 then $minutes else "0"+$minutes) + ":"
        else
          $timer_text += "00:"
        $timer_text += if $seconds_left > 9 then $seconds_left else "0"+$seconds_left  
        $timer_text += "m"
        $timer.find(".time").text $timer_text
      else
        $timer.find(".time").text "00:00m"
        $timer.trigger "time_is_up"

  $(".countdown").livequery ->
    $timer = $(this)
    $timer.append $("<div />").addClass("time")
    $test_case_timer $timer