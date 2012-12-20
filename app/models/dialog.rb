# == Schema Information
#
# Table name: dialogs
#
#  id           :integer          not null, primary key
#  content      :text
#  encounter_id :integer
#  contact_id   :integer 
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Dialog < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :contact#, through: :encounter 
  has_one :user, through: :encounter
  attr_accessible :content, :contact_id

  validates :contact_id, inclusion: { in: lambda { |d| d.user.contacts.
  						map { |c| c.id }}}


end
