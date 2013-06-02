class DialogsController < ApplicationController

  def edit
    @encounter = Encounter.find(params[:encounter_id])
    @dialog = Dialog.find(params[:id])
    @topics = current_user.topics.all
    session[:return_to] = request.referer
  end

  def create
    @encounter = Encounter.find(params[:encounter_id])
  	@dialog = @encounter.dialogs.build(params[:dialog])
  	respond_to do |format|
  		if @dialog.save
        #session[:topic_key] = @dialog.topic_id
  			format.html do
  				flash[:success] = "New dialog created"
  				redirect_to encounter_path @encounter
  			end
        format.js
  		else
        format.html do
          flash[:alert] = "Something went wrong. Try again."
          @topics = current_user.topics.all
          render :new
        end
  		end
  	end
  end

  def update
    @dialog = Dialog.find(params[:id])
    @encounter = @dialog.encounter
    respond_to do |format|
      if @dialog.update_attributes(params[:dialog])
        format.html { redirect_to session[:return_to]}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dialog = Dialog.find(params[:id])
    @dialog.destroy
    respond_to do |format|
      format.html { redirect_to :back}
    end
  end

  private

#  	def set_encounter
#  		@encounter = Encounter.find(session[:encounter_key])
#  	end
end
