require 'sinatra'
require 'bcrypt'
require 'pry'

enable :sessions

#database
require './db/db'


#controllers
require './controllers/users_controller'
require './controllers/sessions_controller'


#models
require './models/user'


get '/' do
  erb :index
end





