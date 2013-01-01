# == Schema Information
#
# Table name: encounters
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  duration   :integer
#  time_of    :datetime
#  enc_type   :string(255)
#

class Encounter < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
  has_many :dialogs
  has_many :topics, through: :dialogs
  attr_accessible :time_of, :duration, :contact_id, :enc_type

  TYPE = %w(phone email text in-person other)

  default_scope order("time_of ASC")

  validates :contact_id, presence: true,
  					inclusion: { in: lambda {|enc| enc.user.contacts.map { |c| c.id}}}

  delegate :full_name, to: :contact
end
