# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('button.show_topics_btn').click  ->
    btn = $(this)
    btn.parent().children('.topics').toggle 200, "linear"
    tx = btn.text()
    tx = if (tx == 'Show Topics') then 'Hide Topics' else 'Show Topics'
    btn.text(tx)

