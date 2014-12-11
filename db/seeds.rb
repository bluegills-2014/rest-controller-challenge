require 'faker'

5.times do 
  Contact.create(name: Faker::Name.name, email: Faker::Internet.email)
end

5.times do 
  Address.create(contact: Contact.all.sample, street: Faker::Address.street_address, city: Faker::Address.city , state: Faker::Address.state_abbr, zip: Faker::Address.zip)
end