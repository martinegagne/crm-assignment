gem 'activerecord', '=4.2.5'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name}""#{last_name}"
  end

end

Contact.auto_upgrade!

# betty = Contact.create('Betty', 'Maker',  'bettymakes@gmail.com', 'Loves Pokemon.')
# octo = Contact.create('Octo', 'Cat', 'octocat@github.com', 'Is it an octopus? Is it a cat?')
# madmax = Contact.create('Mad', 'Max', 'madmax@gail.com', 'crazy driver')
