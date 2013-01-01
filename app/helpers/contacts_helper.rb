module ContactsHelper
	def contact_link(contact)
		name = "#{contact.first_name} #{contact.last_name}:"
		link_to(name, contact_path(contact), class:"contact_link")
	end
end
