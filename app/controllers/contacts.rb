get '/contacts' do
  @contacts = Contact.all

  erb :'contacts/index'
end

# NEW (the form page for a user to fill out and ultimately create a new contact)
get '/contacts/new' do

  @contact = Contact.new

  erb :'contacts/new'
end

# CREATE (actually instantiates the new contact once you click the form submit button on the NEW page)
post '/contacts' do

  @contact = Contact.new(params[:contact])

  if @contact.save
    redirect "/contacts/#{@contact.id}"
  else
    erb :'contacts/new'
  end
end

# SHOW (displays an individual contact page)
get '/contacts/:id' do
  @contact = Contact.find(params[:id])

  erb :'contacts/show'
end

# EDIT (the form page for the user to fill out and ultimately edit an existing contact)
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])

  erb :'contacts/edit'
end

# UPDATE (actually saves the contact once you click the form submit button on the EDIT page )
put '/contacts/:id' do
  @contact = Contact.find(params[:id])

  @contact.update_attributes(params[:contact])

  if @contact.save
    redirect "/contacts/#{@contact.id}"
  else
    erb :'contacts/new'
  end
end

# DELETE
delete '/contacts/:id' do

  @contact = Contact.find(params[:id])

  @contact.destroy

  redirect "/contacts"
end
