$ ->
  # sticky nav
  $('nav').waypoint('sticky')

  # scroll spy nav
  $('main h1, main h3').waypoint ->
    id = $(@).attr('id')
    $('nav li a').removeClass('active')
    $("nav li[data-id=#{id}] > a").addClass('active')

  # fix up/down nav highlights
  $('nav li').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()

    # need extra pixel here
    offset = $("##{$(@).data('id')}").offset().top
    up = (offset - $(window).scrollTop()) < 0
    offset = if up then offset-1 else offset+1
    $('html, body').animate({ scrollTop: offset }, 400)
