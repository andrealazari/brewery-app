get '/' do
    erb :'breweries/index'
end

get '/search' do
    name = params['name']

    brewery_info = HTTParty.get("https://api.openbrewerydb.org/breweries/search?query=#{name}")

    erb :'breweries/search', locals: {
        brewery_info: brewery_info
    }
end

post '/add' do
    name = params['name']
    brewery_type = params['brewery_type']
    street = params['street']
    city = params['city']
    state = params['state']
    country = params['country']
    website = params['website']
    rate = params['rate']
    comments = params['comments']
    user_id = current_user['id']

    create_brewery(name, brewery_type, street, city, state, country, website, rate, comments, user_id)
    
    redirect '/my_page'
end

get '/my_page' do
    user_id = current_user['id']
    # user_id = 22
    breweries = all_breweries_from_current_user(user_id)
    breweries_likes = count_likes(get_post_likes())

    erb :'/breweries/my_page', locals: {
        breweries: breweries,
        breweries_likes: breweries_likes
    }
end

get '/:id/edit' do
    id = params['id']

    brewery = get_brewery(id)

    erb :'breweries/edit', locals: {
        brewery: brewery
    }
end

put '/:id' do
    rate = params['rate']
    comments = params['comments']
    id = params['id']

    update_brewery(rate, comments, id)

    redirect '/my_page'

end

delete '/:id' do
    id = params['id']

    delete_brewery(id)

    redirect '/my_page'
end

get '/brewery_feed' do
    user_id = current_user['id']
    breweries = all_breweries_from_other_users(user_id)
    breweries_likes = count_likes(get_post_likes())


    erb :'breweries/brewery_feed', locals: {
        breweries: breweries,
        breweries_likes: breweries_likes
    }
end


