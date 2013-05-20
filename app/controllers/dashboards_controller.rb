class DashboardsController < ApplicationController
  def show
    session[:current_encounter] = nil
    @encounters = current_user.encounters
    @topics = current_user.topics
  end
end
