class Dashboard 
  def initialize user
    @user = user
  end

  def timeline
    Timeline.new @user
  end
end
