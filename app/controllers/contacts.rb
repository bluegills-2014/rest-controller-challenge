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

#displays specific contact
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

#edit
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end
#edit
put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  redirect "/contacts/#{@contact.id}"
end
#delete
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end



