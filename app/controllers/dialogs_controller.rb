class DialogsController < ApplicationController
	before_filter :set_encounter

  def new
  	@dialog = @encounter.dialogs.build
  end

  def create
  	@dialog = @encounter.dialogs.build(params[:dialog])
  	respond_to do |format|
  		if @dialog.save
  			format.html do
  				flash[:success] = "New dialog created"
  				redirect_to encounter_path @encounter
  			end
  		else
  			render :new
  		end
  	end
  end


  private

  	def set_encounter
  		@encounter = Encounter.find(session[:encounter_key])
  	end
end
