class Contact < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :email, :first_name, :last_name, :phone, :position

  validates :first_name, presence: true
  validates :email, allow_blank: true, format: { with: VALID_EMAIL_REGEX}
end
