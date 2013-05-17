jQuery ->
	$('li a.contact').on 'click', (e) ->
    #e.preventDefault()
    $(this).closest("ul").children().removeClass("active")
    $(this).closest("li").addClass("active")
    #		window.location.href = '/contacts/new'
