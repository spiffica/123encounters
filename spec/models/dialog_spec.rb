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

require 'spec_helper'

describe Dialog do
	before do
		@dialog = Dialog.new(content:"Here it is", user_id:1, encounter_id:1,
								contact_id:1 )
	end
	subject { @dialog }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:encounter_id) }
  it { should respond_to(:contact_id) }

  it "validates presence of user_id" do
  	expect(@dialog.save).to raise_error
  end
  it ""

end
