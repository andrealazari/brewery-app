get '/' do
    erb :'breweries/index'
end

get '/search' do
    location = params['location']

    brewery_info = HTTParty.get("https://api.openbrewerydb.org/breweries/search?query=#{location}")

    erb :'breweries/search', locals: {
        brewery_info: brewery_info
    }
end