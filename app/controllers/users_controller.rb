class UsersController < ApplicationController
  def show
  	@contacts = current_user.contacts.all
  end
end
