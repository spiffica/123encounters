$ ->
  $('form#new_user').submit ->
    email = $('input#user_email').val()
    localStorage.userEmail = email

  $('input#user_email').val(localStorage.userEmail)
