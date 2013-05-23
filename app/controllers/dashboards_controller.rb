class DashboardsController < ApplicationController
  def show
    session[:current_encounter] = nil
    @encounters = current_user.encounters.includes(:dialogs,:topics).limit(10)
    @topics = current_user.topics
  end
end
