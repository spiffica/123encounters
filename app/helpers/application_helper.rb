module ApplicationHelper
  def active_encounter
    Encounter.find(session[:current_encounter]) if session[:current_encounter]
  end
end
