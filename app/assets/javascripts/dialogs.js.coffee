$ ->
  $('button.show_dialogs_btn').click ->
    btn = $(this)
    btn.next('div').toggle 200, "linear"
    tx = btn.text()
    tx = if (tx == 'Show Dialogs') then 'Hide Dialogs' else 'Show Dialogs'
    btn.text(tx)
