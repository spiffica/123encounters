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

require 'spec_helper'

describe Encounter do
  pending "add some examples to (or delete) #{__FILE__}"
end
