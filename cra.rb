#load 'contact.rb'
#require './contact'
require_relative 'contact'
require_relative 'rolodex'

class CRM
	def self.run
		my_crm = new # or CRM.new both are
		my_crm.main_menu
	end

	def initialize
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all contacts"
		puts "[5] Display a contact"
		puts "[6] Display by attribute"
		puts "[7] Exit"
		puts "Enter a selection:"
	end

	def call_selection(selection)
		add_new_contact if selection == 1
		modify_contact if selection == 2
		delete_contact if selection == 3
		display_all if selection == 4
		display_contact if selection == 5
		display_by_attribute if selection == 6
		exit if selection == 7
	end

	def main_menu
		while true
			print_main_menu
			selection = gets.chomp.to_i
			call_selection(selection)
		end
	end

	def add_new_contact
		print "First name: "
		first_name = gets.chomp
		print "Last name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def display_contact
		print "Enter id of user you would like to view: "
		contact_id = gets.chomp.to_i
		contact = @rolodex.find(contact_id)
		contact.to_s
	end

	def modify_contact
		print "Enter the id of the contact you wish to change: "
		contact_id = gets.chomp.to_i
		print "Do you want to edit contact #{contact_id}? Yes or No?"
		affirmation = gets.chomp.upcase
		if affirmation == "YES" || affirmation == "Y"
			contact = @rolodex.find(contact_id)
			puts "What do you want to change? [1] First Name [2] Last Name [3] Email [4] Note "
			modify_selection = gets.chomp.to_i
			if modify_selection == 1
				puts "what do you want to change the First Name to? "
				contact.first_name = gets.chomp.to_s
			elsif modify_selection == 2
				puts "what do you want to change the Last Name to? "
				contact.last_name = gets.chomp.to_s
			elsif modify_selection == 3
				puts "what do you want to change the Email to? "
				contact.email = gets.chomp.to_s
			elsif modify_selection == 4
				puts "what do you want to change the Note to? "
				contact.note = gets.chomp.to_s
			end
			contact.to_s
		end
		main_menu
	end

	def delete_contact
		print "Enter the id of the contact you wish to delete: "
		contact_id = gets.chomp.to_i
		contact = @rolodex.find(contact_id)
		contact.to_s
		print "Are you sure you want to delete this contact? Yes or No? "
		affirmation = gets.chomp.upcase
		if affirmation == "YES" || affirmation == "Y"
			@rolodex.delete(contact)
			puts "This contact has been deleted from the Rolodex"
		end
		main_menu
	end

	def display_all
		puts "\e[H\e[2J"
		@rolodex.display_all
	end
end

CRM.run