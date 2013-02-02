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
  
  attr_accessible :content, :topic_id

  delegate :full_name, :contact, :time_of, to: :encounter
  delegate :title, to: :topic

  validates :topic_id, presence: true
  validates :encounter_id, presence: true


end
