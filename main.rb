require 'sinatra'
require 'bcrypt'
require 'pry'
require 'httparty'

enable :sessions

#database
require './db/db'


#controllers
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/breweries_controller'


#models
require './models/user'
require './models/brewery'

#helpers
require './helpers/sessions_helper'






