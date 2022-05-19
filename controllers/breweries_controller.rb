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
    breweries = all_breweries()

    erb :'/breweries/my_page', locals: {
        breweries: breweries
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