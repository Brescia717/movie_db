# require 'Gemfile'
require  'sinatra'
require  'sinatra/reloader'
require  'pg'
require  'pry'


def db_connection
  @db_info = []
  begin
    @db_info = PG.connect(dbname: 'movies')
  ensure
    @db_info.close
  end
end

get '/actors' do
  @actors = Array.new
  db_connection do |conn|
   @actors =  conn.exec('SELECT * FROM actors')
  end
  erb :actors
end
