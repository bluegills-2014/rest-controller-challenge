get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new(contact_id: @contact)
  erb:'/addresses/new'
end


post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @new_address = Address.new(params[:address])
  @new_address.contact_id = @contact.id
  @new_address.save!
  
  redirect "/contacts/#{@contact.id}" 
end

get '/contacts/:contact_id/addresses/:id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:id])

  erb:'/addresses/edit'
end


put '/contacts/:contact_id/addresses/:id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:id])
  @address.update_attributes(params[:address])

  redirect "/contacts/#{@contact.id}"
end

delete '/contacts/:contact_id/addresses/:id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:id])
  @address.destroy

  redirect "/contacts/#{@contact.id}"
end