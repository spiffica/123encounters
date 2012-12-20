class EncountersController < ApplicationController

	def index
		@encounters = current_user.encounters.all
	end

  def new
  	@encounter = current_user.encounters.build
  	@contacts = current_user.contacts.all 
  end

  def show
  	@encounter = Encounter.find(params[:id])
  	@dialog = @encounter.dialogs.build
  	@dialogs = @encounter.dialogs.all
  	session[:encounter_key] = @encounter.id
  end

  def edit
  	@encounter = Encounter.find(params[:id])
  	@contacts = current_user.contacts.all
  	session[:encounter_key] = @encounter.id
  end

  def create
  	@encounter = current_user.encounters.build(params[:encounter])
  	respond_to do |format|
  		if @encounter.save
  			session[:encounter_key] = @encounter.id  			
  			format.html { redirect_to @encounter }
  		else
  			format.html do
  				@contacts = current_user.contacts.all
  				render :new 
  			end
  		end
  	end
  end
  def update
  	@encounter = current_user.encounters.find(params[:id])
  	respond_to do |format|
  		if @encounter.update_attributes(params[:encounter])
  			format.html do
  				flash[:success] = "Encounter updated" 
  				redirect_to @encounter
  			end
  		else
  			format.html do
  				flash[:error] = "Encounter failed to update"
  				@contacts = current_user.contacts.all
  				render :edit
  			end
  		end
  	end
  end

  def destroy
  	@encounter = current_user.encounters.find(params[:id])
		@encounter.destroy
  	respond_to do |format|
			format.html do
				flash[:success] = "Encounter destroyed" 
				redirect_to encounters_path
			end
		end
	end
end
