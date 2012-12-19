# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  company    :string(255)
#  position   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :encounters
  attr_accessible :company, :email, :first_name, :last_name, :phone, :position

  validates :first_name, presence: true
  validates :email, allow_blank: true, format: { with: VALID_EMAIL_REGEX}
  # default_scope where(:user_id => self.user.id)

  
end
