class ContactsController < ApplicationController

	def new
		@contact = current_user.contacts.build
	end

	def create
		@contact = current_user.contacts.build(params[:contact])
		respond_to do |format|
			if @contact.save
				format.html { redirect_to root_path } 
			else
				format.html { render :new }
			end
		end
	end
end
