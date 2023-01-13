require 'sinatra/base'
require 'sinatra/reloader'
require 'erb'
require 'pry'

require './lib/db_connection'

# DatabaseConnection.connect

connection = DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get '/' do
    erb
  end
  get '/albums' do
    sql = 'SELECT * FROM albums'
    @albums = DatabaseConnection.connect.exec_params(sql, [])
    erb :albums
  end

  get '/artists' do
    sql = 'SELECT * FROM artists'
    @artists = DatabaseConnection.connect.exec_params(sql, [])
    erb :artists
  end

  post '/artists' do
    @name = params[:name]
    @genre = params[:genre]
    sql = 'INSERT INTO artists (name, genre) VALUES (#@name, #@genre);'
    sql_params = [@name, @genre]
    DatabaseConnection.exec_params(sql, [])

    # @artists = DatabaseConnection.connect.exec_params(sql, [])
    # erb :artists
  end
end
