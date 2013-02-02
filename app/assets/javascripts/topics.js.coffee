# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('span#contact_list input[type=checkbox]').on 'click', () ->
		id = $(this).attr('id')
		$('div.' + id).toggle()

		# $('span.contact').on 'click', () ->
		# id = $(this).attr('id')
		# # $(this).css('background-color' : 'red')
		# # alert(id)
		# # $('body').css('background-color': 'red')
		# $('div.' + id).toggle()