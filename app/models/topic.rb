# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :dialogs
	has_many :encounters, through: :dialogs
	has_many :contacts, through: :encounters
  attr_accessible :title, :background

  validates :title, presence: true

  def unique_contacts
  	contacts.uniq
  end
  
end
