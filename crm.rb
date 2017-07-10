require_relative "contact"

class CRM

  def initialize
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an exisiting contact"
    puts "[3] Delete a contact"
    puts "[4] Dislay all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "Enter a number:"
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print "Enter First Name:"
    first_name = gets.chomp

    print "Enter Last Name:"
    last_name = gets.chomp

    print "Enter Email Address:"
    email = gets.chomp

    print "Enter a Note:"
    note = gets.chomp

  Contact.create(first_name, last_name, email, note)
end

  def modify_existing_contact
    print "How do you want to search for the contact (first_name, last_name, email, or note)?"
    search_by_attribute = gets.chomp

    print "What is the value for the contact?"
    value = gets.chomp

    matched_contact = Contact.find_by(search_by_attribute, value)
    puts matched_contact


    if matched_contact != nil
        print "Which contact value would you like to modify?"
        attribute_to_be_changed = gets.chomp

        print "What would you like to change it to?"
        new_value = gets.chomp

        matched_contact.update(attribute_to_be_changed, new_value)
        print "Changed #{attribute_to_be_changed} to #{new_value}!"
    else
      puts "Contact not found. Please try again."
    end

  end


  def delete_contact
    puts "Please insert the ID number of the contact would you like to delete."
    id = id gets.to_i

    contact = Contact.find(id)
    contact.delete
  end

  def display_all_contacts
    puts "Now displaying all contacts..."
    puts Contact.all.inspect
  end

  def search_by_attribute
    
  end

end

a_crm_app = CRM.new
a_crm_app.main_menu
a_crm_app.print_main_menu
# a_crm_app.modify_existing_contact
