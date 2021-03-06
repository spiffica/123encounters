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
  belongs_to :encounter, inverse_of: :dialogs
  belongs_to :topic, inverse_of: :dialogs
  
  attr_accessible :content, :topic_id, :new_topic
  attr_accessor :new_topic

  delegate :full_name, :contact, :time_of, :user_id, to: :encounter
  delegate :title, to: :topic

  validates :topic_id, presence: true
  validates :encounter_id, presence: true
  

  scope :by_topic, ->(topic) { where(topic_id: topic) }
  scope :order_by_encounter, -> { joins(:encounter).order('encounters.time_of DESC') }
  before_validation  :create_topic
  

# move this to a service object related to caller
  def create_topic
      t = Topic.create(title: new_topic) if new_topic.present?
      t.update_column(:user_id, self.user_id)
      t.save
      self.topic = t
  end
end
