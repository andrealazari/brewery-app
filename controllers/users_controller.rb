get '/signup' do
    erb :'users/new'
end

post '/user' do
    name = params['name']
    email = params['email']
    password = params['password']

    create_user(name, email, password)

    redirect '/'
end