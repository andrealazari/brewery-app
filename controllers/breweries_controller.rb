get '/' do
    erb :'breweries/index'
end

get '/search' do
    location = params['location']

    # brewery_info = HTTParty.get("http://beermapping.com/webservice/locquery/b42ae42c7a04c1de877aa79bc8d1d68b/#{location}&s=json")

    brewery_info = HTTParty.get("https://api.openbrewerydb.org/breweries/search?query=#{location}")

    erb :'breweries/search', locals: {
        brewery_info: brewery_info
    }
end