get '/login' do

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

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']
        redirect '/my_page'
    else
        redirect '/login?login_message=true'
    end
end

delete '/sessions' do
    session['user_id'] = nil

    redirect '/'
end

post '/like' do
    brewery_id = params['post_like'].to_i
    user_id = current_user['id'].to_i

    post_likes(brewery_id, user_id)

    redirect '/brewery_feed'
end