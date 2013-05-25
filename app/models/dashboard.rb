class Dashboard 
  def initialize user
    @user = user
  end

  def timeline
    Timeline.new
  end
end
