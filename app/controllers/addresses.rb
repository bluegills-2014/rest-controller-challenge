# get '/:addresses' do
# erb :"index"
# end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.build #Use that because it is used the connection so it is stronger have less chance to break
  #@address = Address.new(contact_id: @contact)

  erb :"/addresses/new"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  @address.contact_id = @contact.id
  @address.save
  erb :"contacts/show"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

put '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.contact_id = @contact.id
  @address.update_attributes(params[:address])
  erb :"contacts/show"
end
