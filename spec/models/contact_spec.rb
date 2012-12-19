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

require 'spec_helper'

describe Contact do
  before { @contact = FactoryGirl.build :contact}

  # subject { @contact } 

  it { should respond_to(:user)}
  it { should respond_to(:first_name)}
  it { should respond_to(:last_name)}
  it { should respond_to(:company)}
  it { should respond_to(:email)}
  it { should respond_to(:phone)}
  it { should respond_to(:position)}
  it "requires a first name" do
  	@contact.first_name = ''
  	expect(@contact).not_to be_valid
  end
  it "requires a valid email" do
  	@contact.email = "whatevs"
  	expect(@contact).not_to be_valid
  	@contact.email = "here@Now.CoM"
  	expect(@contact).to be_valid
  end
  it "returns blank array when no current_user" do
    @con = FactoryGirl.create :contact, :user
    expect{Contact.all}.to eq([])
  end
end
 
