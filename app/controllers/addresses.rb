get '/contacts/:id/addresses/new' do
@contact = Contact.find(params[:id])
@address = Address.new
erb :'/addresses/new'
end

post '/contacts/:id/addresses' do
@contact = Contact.find(params[:id])
add = Address.new(params[:address])
add.contact_id = @contact.id
add.save
redirect :"/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:id2/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:id2])
  erb :'/addresses/edit'
end

put '/contacts/:contact_id/addresses/:id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:id])
  @address.update_attributes(params[:address])
  redirect :"/contacts/#{params[:contact_id]}"
end

delete '/contacts/:contact_id/addresses/:id' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.find(params[:id])
  @address.destroy
  redirect :"/contacts/#{params[:contact_id]}"
end



