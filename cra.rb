def print_main_menu
	puts "[1] Add new contact"
	puts "[2] Modify an existing contact"
	puts "[3] Delete a contact"
	puts "[4] Display all contacts"
	puts "[5] Display an attribute"
	puts "[6] Exit"
	puts "Enter a selection:"
end

selection = gets.chomp.to_i

add_new_contact if selection == 1
modify_contact if selection == 2
delete_contact if selection == 3
display_all if selection == 4
display_by_attribute if selection == 5
exit if selection == 6
