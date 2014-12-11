# NEW (the form page for a user to fill out and ultimately create a new address)
get '/contacts/:id/addresses/new' do

  @contact = Contact.find(params[:id])

  @address = Address.new

  erb :'addresses/new'
end

# CREATE (actually instantiates the new address once you click the form submit button on the NEW page)
post '/contacts/:id/addresses' do

  @contact = Contact.find(params[:id])
  #@address = Address.new(params[:address])
  #@contact.addresses << @address
  @address = @contact.addresses.build(params[:address])

  if @address.save
    redirect "/contacts/#{@contact.id}"
  else
    erb :'addresses/new'
  end
end

# EDIT (the form page for the user to fill out and ultimately edit an existing address)
get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])

  erb :'addresses/edit'
end

# UPDATE (actually saves the address once you click the form submit button on the EDIT page )
put '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])

  @address.update_attributes(params[:address])

  if @address.save
    redirect "/contacts/#{@contact.id}"
  else
    erb :'addresses/new'
  end
end

# DELETE
# delete '/contacts/:id' do

#   @contact = Contact.find(params[:id])

#   @contact.destroy

#   redirect "/contacts"
# end
