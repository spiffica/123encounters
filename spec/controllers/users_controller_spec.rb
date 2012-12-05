require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    it "returns http success" do
    	@user = FactoryGirl.create :user
    	sign_in @user
      get 'show'
      response.should be_success
    end
  end

end
