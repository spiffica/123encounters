class DashboardsController < ApplicationController
  def show
   # @contacts = current_user.contacts
    @encounters = current_user.encounters
    @topics = current_user.topics
  end
end
