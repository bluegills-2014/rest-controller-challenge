
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    redirect '/contacts'
  else
    erb :'contacts/new'
  end
end

