class ContactsController < ApplicationController
 
	def index
		@contacts = current_user.contacts.order(:last_name)
	end

	def show
		@contact = Contact.includes(:encounters,:dialogs => :topic).find(params[:id])
    @encounters = @contact.encounters
    @topics = @contact.topics.uniq
	end

	def new
		@contact = current_user.contacts.build
	end

	def edit
		@contact = current_user.contacts.find(params[:id])
	end

	def create
		@contact = current_user.contacts.build(params[:contact])
		respond_to do |format|
			if @contact.save
				session[:contact_key] = @contact.id
				format.html { redirect_to new_contact_encounter_path(@contact) } 
			else
				format.html { render :new }
			end
		end
	end

	def update
		@contact = current_user.contacts.find(params[:id])
		respond_to do |format|
			if @contact.update_attributes(params[:contact])
				flash[:success] = "Contact successfully updated"
				format.html { redirect_to contact_path(@contact)}
			else
				format.html { render 'new'}
			end
		end		
	end

	def destroy
		@contact = current_user.contacts.find(params[:id])
		@contact.destroy
		respond_to do |format|
			format.html { redirect_to contacts_path }		
		end
	end
end
