# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('button#new_topic').insertAfter('select#dialog_topic_id')

  $('button#new_topic').on 'click', () ->
  	#e.preventDefault()
    window.location.href = "/topics/new"
