class EncountersController < ApplicationController
  def new
  	@encounter = current_user.encounters.build
  	@contacts = current_user.contacts.all 
  end

  def create
  	@encounter = current_user.encounter.build(params[:encounter])

  end
end
