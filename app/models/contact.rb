class Contact < ActiveRecord::Base
  attr_accessible :company, :email, :first_name, :last_name, :position
end
