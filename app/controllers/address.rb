get '/contacts/:contact_id/addresses/new' do
   @contact = Contact.find(params[:contact_id])
   @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.create(params[:address])
  if @address.save!
    redirect "/contacts/#{params[:contact_id]}"
  end
end

get '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/show'
end

#edit
get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:address_id])
  erb :'addresses/edit'
end
#edit
put '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:address_id])
  @address.update_attributes(params[:address])
  redirect "/contacts/#{@contact.id}"
end

