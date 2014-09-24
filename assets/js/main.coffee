$ ->
  # sticky nav
  $('nav').waypoint('sticky')

  # scroll spy nav
  to = null

  $('main h1, main h3').waypoint ->
    id = $(@).attr('id')
    clearTimeout(to)
    
    to = setTimeout ->
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

      # update url hash
      history.pushState(null, null, "##{id}")
    , 10

  # on nav item click, navigate to right block
  $('nav li').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()

    offset = $("##{$(@).data('id')}").offset().top
    up = (offset - $(window).scrollTop()) < 0
    offset = if up then offset - 1 else offset + 1
    $('html, body').animate({ scrollTop: offset }, 0)
