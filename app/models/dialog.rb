# == Schema Information
#
# Table name: dialogs
#
#  id           :integer          not null, primary key
#  content      :text
#  encounter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  topic_id     :integer
#

class Dialog < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :topic
  
  attr_accessible :content, :topic_id, :new_topic
  attr_accessor :new_topic

  delegate :full_name, :contact, :time_of, :user_id, to: :encounter
  delegate :title, to: :topic

  validates :topic_id, presence: true
  validates :encounter_id, presence: true
  
  before_validation  :create_topic
  


  def create_topic
    self.topic = Topic.create(title: new_topic) if new_topic.present?
    self.topic.user_id = user_id
    self.topic.save
  end
end
