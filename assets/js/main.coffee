$ ->
  # sticky nav
  $('nav').waypoint('sticky')

  # scroll spy nav
  $('main .intro h1, main .instruction h1, main h3').waypoint ->
    id = $(@).attr('id')
    
    # expand and contract lists
    $('nav li > ul').hide()
    parent_cat = $("nav li[data-id=#{id}]").parent().parent('li')
    if parent_cat.length
      parent_cat.find('ul').show()
    else
      $("nav li[data-id=#{id}]").find('ul').show()

    # active class highlight
    $('nav li a').removeClass('active')
    $("nav li[data-id=#{id}] > a").addClass('active')

  # on nav item click, navigate to right block and hash the url
  $('nav li').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()

    id = $(@).data('id')
    offset = $("##{id}").offset().top
    up = (offset - $(window).scrollTop()) < 0
    offset = if up then offset - 1 else offset + 1

    $('html, body').animate({ scrollTop: offset }, 0)
    history.pushState(null, null, "##{id}")

  # on doc headline click, hash the url
  $('main h1, main h3').on 'click', ->
    history.pushState(null, null, "##{$(@).attr('id')}")
