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
#

class Encounter < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
  attr_accessible :dialog, :duration, :subject
end
