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
          if check.prop('checked')
            $('div.' + id).show()
          else
            $('div.' + id).hide()
    else
      dialogs.hide 'slow', ->
        btn.text('Show Dialogs')



      #    btn.nextAll('div.dialogs').first().toggle 200, "linear"
      #    tx = btn.text()
      #    tx = if (tx == 'Show Dialogs') then 'Hide Dialogs' else 'Show Dialogs'
      #    btn.text(tx)
      #
      #    #this is having conflicts with above. ???? works if placed first
      #    # but then the above code doesn't work
      #	$('span#contact_list input[type=checkbox]').click ->
      #		id = $(this).attr('id')
      #		$('div.' + id).toggle()
