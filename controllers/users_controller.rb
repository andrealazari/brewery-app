get '/signup' do
    if params['sign_up_message'] == nil
        erb :'users/new', locals: {
            sign_up_message: ''
        }
    else 
        erb :'users/new', locals: {
            sign_up_message: 'This user has already a brewery! Please try again.'
        }
    end
end

post '/user' do
    name = params['name']
    email = params['email']
    password = params['password']

    # emails_already_created = all_users_emails_created().to_a
    # emails_already_created.each do |user_email|
    #     if user_email.has_value? email
    #         redirect '/signup?sign_up_message=true'
    #         break
    #     else
    #         create_user(name, email, password)
    #         redirect '/'
    #     end
    # end

    if find_user_by_name(name).to_a.count > 0
        redirect '/signup?sign_up_message=true'
    elsif find_user_by_email(email).to_a.count > 0
        redirect '/signup?sign_up_message=true'
    else
        user = create_user(name, email, password) 
        
        session['user_id'] = user['id']
        
        redirect '/my_page'
    end

    if params['login_message'] == nil
        erb :'sessions/new', locals: {
            login_message: ''
        }
    else 
        erb :'sessions/new', locals: {
            login_message: 'Wrong email/password! Are you already drunk?'
        }
    end

end