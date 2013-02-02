module TopicsHelper
	def uniq_contacts(dialogs)
		dialogs.inject([]) { |result,d| result << d.contact }.uniq
	end
end
