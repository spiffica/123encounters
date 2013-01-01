# == Schema Information
#
# Table name: discussions
#
#  id           :integer          not null, primary key
#  encounter_id :integer
#  topic_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Discussion do
  pending "add some examples to (or delete) #{__FILE__}"
end
