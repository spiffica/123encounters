$ ->
  $('div.left_sidebar li a.active').parent().addClass('active')

  checkBtnState = ->
    $('nav.tab-links li').removeClass('active')
    $('div.contacts-data div.data-tab').hide 0, ->
      if localStorage.encountersTab == "true"
        $('nav.tab-links li#encounters').addClass('active')
        $('div#encounters-tab').show()
      else if localStorage.topicsTab == "true"
        $('nav.tab-links li#topics').addClass('active')
        $('div#topics-tab').show()
      else
        localStorage.encountersTab = "true"
        checkBtnState()

  $('li#encounters').click ->
    localStorage.encountersTab = "true"
    localStorage.topicsTab = "false"
    checkBtnState()


  $('li#topics').click ->
    localStorage.encountersTab = "false"
    localStorage.topicsTab = "true"
    checkBtnState()



  checkBtnState()

# $('li a.contact').on 'click', (e) ->
#   e.preventDefault()
#   $(this).closest("ul").children().removeClass("active")
#   $(this).closest("li").addClass("active")
#   #		window.location.href = '/contacts/new'

