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
end
 