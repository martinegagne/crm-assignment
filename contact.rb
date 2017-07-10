gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact

attr_reader :first_name, :last_name, :email
attr_writer :note

@@contacts = []
@@id = 1

  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts<< new_contact
    return new_contact
  end

  def self.all
    return @@contacts
  end

  def self.find (id)
    @id = id
    @@contacts.each do |current_contact|
    if current_contact == id
      return contact
    end
    end
  end

  def update(attribute, new_value)
    case attribute
    when "first_name"
      self.first_name = new_value
    when "last_name"
      self.last_name = new_value
    when "email"
      self.email = new_value
    when"note"
      self.note = new_value
    else
      puts "invalid attribute"
    end
  end

  def self.find_by (attribute, value)
    @@contacts.each do |current_contact|
      if attribute == "first_name" && current_contact.first_name == value
        return current_contact
      elsif attribute == "last_name" && current_contact.last_name == value
        return current_contact
      elsif attribute == "email" && current_contact.email == value
        return current_contact
      elsif attribute == "note" && current_contact.note == value
        return current_contact
      end
    end # CLOSE LOOP

      return nil

  end # CLOSE find_by

  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{first_name}""#{last_name}"
  end


  def delete
    @@contacts.delete(self)
  end


betty = Contact.create('Betty', 'Maker',  'bettymakes@gmail.com', 'Loves Pokemon.')
octo = Contact.create('Octo', 'Cat', 'octocat@github.com', 'Is it an octopus? Is it a cat?')
madmax = Contact.create('Mad', 'Max', 'madmax@gail.com', 'crazy driver')

end
