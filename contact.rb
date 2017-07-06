class Contact

attr_reader :first_name, :last_name, :email
attr_writer :note

@@contacts = []
@@id = 1

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts<< new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find (id)
    @id = id
    @@contacts.each do |current_contact|
    if current_contact == id
      return contact
    end
    end
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
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

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
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
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{first_name}""#{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

betty = Contact.create('Betty', 'Maker',  'bettymakes@gmail.com', 'Loves Pokemon.')
octo = Contact.create('Octo', 'Cat', 'octocat@github.com', 'Is it an octopus? Is it a cat?')
madmax = Contact.create('Mad', 'Max', 'madmax@gail.com', 'crazy driver')


betty.delete
p @@contacts

end
