module ContactsHelper
	def contact_link(contact)
    name = full_name(contact)
		link_to(name, contact_path(contact), class:"contact_link")
	end

  def full_name(contact)
		 "#{contact.first_name} #{contact.last_name}"
  end
end
