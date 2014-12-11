get '/' do
 ' Hello World'
end
#displays all contacts
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end




