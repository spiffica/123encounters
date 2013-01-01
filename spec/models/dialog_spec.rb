# == Schema Information
#
# Table name: dialogs
#
#  id           :integer          not null, primary key
#  content      :text
#  encounter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  topic_id     :integer
#

require 'spec_helper'

describe Dialog do
	before do
		@dialog = Dialog.new(content:"Here it is")
	end
	subject { @dialog }
  it { should respond_to(:content) }
  it { should respond_to(:encounter_id) }
  it { should respond_to(:time_of) }
  it { should respond_to(:first_name) }

  
  describe "#list_by_topic" do
    it "lists all dialogs in a topic in order of encounter" do
      @user = FactoryGirl.create :user
      @contact = FactoryGirl.create :contact, user_id: @user.id
      @topic = FactoryGirl.create :topic
      @encounter1 = FactoryGirl.create :encounter, contact_id: @contact.id,
        user_id: @user.id, time_of: '2012-12-28 0:00:00'
      @encounter2 = FactoryGirl.create :encounter, contact_id: @contact.id, 
        user_id: @user.id, time_of: '2012-12-29 0:00:00'
      @dialog1 = FactoryGirl.create :dialog, topic_id: @topic.id, encounter_id: @encounter1.id
      @dialog2 = FactoryGirl.create :dialog, topic_id: @topic.id, encounter_id: @encounter2.id
      expect{ Dialog.list_by_topic }.to eq([@dialog1,@dialog2])
    end
  end
end
