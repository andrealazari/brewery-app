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

    create_brewery(name)

    redirect '/breweries/add'
end