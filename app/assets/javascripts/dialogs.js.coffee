$ ->
  $('button.show_dialogs_btn').click ->
    btn = $(this)
    tx = btn.text()
    dialogs = btn.nextAll('div.dialogs').first()
    if tx == 'Show Dialogs'
      dialogs.show 'slow', ->
        btn.text('Hide Dialogs')
        $('span.contact_list input[type=checkbox]').click ->
          check = $(this)
          id = check.attr('id')
          container = $(this).closest('div.dialogs')
          if check.prop('checked')
            container.find('div.' + id).show()
          else
            container.find('div.' + id).hide()
    else
      dialogs.hide 'slow', ->
        btn.text('Show Dialogs')


  # needs serious work if need to use it
  # can't isolate the one target that was clicked in the ajaxSuccess
  # it isolates the proper $this in the click part, but not in the ajax
  $('a.topic-dialogs-link').on
    click: ->
      target = $(this)
      target.hide()
      
    ajaxSuccess:(e) ->
      jTarget = $(e.target).prop("id")
      console.log(jTarget)
      newBtn = $('a#'+jTarget).closest('div')
        .children('button.show_dialogs_btn')
      newBtn.show()
      newBtn.trigger('click')

