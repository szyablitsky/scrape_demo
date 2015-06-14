hideAll = ->
  $('#response').hide()
  $('#status-expired').hide()
  $('#status-active').hide()
  $('#error').hide()
  $('#progress').hide()

$ ->
  hideAll()

  $('.imei-form').on 'ajax:before', ->
    hideAll()
    $('#progress').show()
    $('.imei-form button').addClass('disabled')

  $('.imei-form').on 'ajax:complete', ->
    $('#progress').hide()
    $('.imei-form button').removeClass('disabled')

  $('.imei-form').on 'ajax:error', ->
    $('#error').slideDown()

  $('.imei-form').on 'ajax:success', (xhr, data, status) ->
    hideAll()
    if JSON.parse(data)
      $('#status-active').show()
    else
      $('#status-expired').show()
    $('#response').slideDown()
