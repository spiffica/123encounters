class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :load_contacts

  protected

  def load_contacts
    @contacts ||= current_user.contacts.order(:first_name) if current_user
  end
end
