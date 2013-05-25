# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  background :text
#

class Topic < ActiveRecord::Base
	belongs_to :user, inverse_of: :topics
	has_many :dialogs, inverse_of: :topic
	has_many :encounters, through: :dialogs
	has_many :contacts, through: :encounters
  attr_accessible :title, :background

  validates :title, presence: true

  #default_scope includes(:contacts, :dialogs)

  def unique_contacts
    
  	contacts.uniq
  end
  
end
