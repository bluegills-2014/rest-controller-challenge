get '/' do
  erb:'index'
end


get '/contacts' do
  @contacts = Contact.all
  erb:'contacts/index'
end


get '/contacts/new' do
  @contact = Contact.new
  erb:'/contacts/new'
end


get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb:'contacts/edit'
end


get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb:'/contacts/show'
end


put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])

  redirect "/contacts/#{@contact.id}"
end


post '/contacts' do 
  @contact = Contact.new(params[:contact])
  @contact.save!

  redirect "/contacts/#{@contact.id}"
end


delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect '/contacts'
end






