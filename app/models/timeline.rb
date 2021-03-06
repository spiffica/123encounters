class Timeline
  extend ActiveModel::Naming
  def initialize user
    @user = user
  end

  def encounters
    Encounter.includes(:topics,:dialogs,:contact).where(user_id: @user)
  end

  def topics
    Topic.where(user_id: @user)
  end
end
