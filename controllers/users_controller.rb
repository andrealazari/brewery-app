get '/signup' do
    if params['sign_up_message'] == nil
        erb :'users/new', locals: {
            sign_up_message: ''
        }
    else 
        erb :'users/new', locals: {
            sign_up_message: 'This user has alredy a brewery! Please try again.'
        }
    end
end

post '/user' do
    name = params['name']
    email = params['email']
    password = params['password']

    emails_already_created = all_users_emails_created().to_a
    emails_already_created.each do |user_email|
        if user_email.has_value? email
            redirect '/signup?sign_up_message=true'
            break
        else
            create_user(name, email, password)

            redirect '/my_page'
        end
    end
end