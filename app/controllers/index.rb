get '/' do
 ' Hello World'
end
#displays all contacts
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

#create new contact form
get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

#creates new contact
post '/contacts' do
  @contact = Contact.new(params[:contact])
  @contact.save!
  redirect '/contacts'
end


