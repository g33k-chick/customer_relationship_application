class Rolodex
	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def find(contact_id)
		@contacts.find do |contact|
			contact.id == contact_id
		end
	end

	def delete(contact)
		@contacts.delete(contact)
	end

	def display_all
		@contacts.each do |contact|
			contact.id.to_s
			contact.to_s
		end
	end

end
