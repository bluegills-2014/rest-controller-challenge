get '/contacts' do
  @contacts = Contact.all
  erb :'/contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'/contacts/new'
end

post '/contacts' do
  @contact = Contact.new(params[:contact])
  @contact.save
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  @address.contact = @contact
  @address.save
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

post '/contacts/1' do
  "Hello World"
end
