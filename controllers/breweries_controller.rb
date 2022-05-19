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

post '/breweries/add' do
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
    
    redirect '/breweries/my_page'
end

get '/breweries/my_page' do
    breweries = all_breweries()

    erb :'/breweries/my_page', locals: {
        breweries: breweries,
    }
end