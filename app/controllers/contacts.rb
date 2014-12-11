get '/contacts/index' do
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

delete '/contacts/edit' do
  @contact.
end

put 