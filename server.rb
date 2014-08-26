# require 'Gemfile'
require  'sinatra'
require  'sinatra/reloader'
require  'pg'
require  'pry'


# def db_connection
#   # @db_info = []
#   begin
#     conn = PG.connect(dbname: 'movies')
#     @actors =  conn.exec('SELECT actors FROM movies')
#   ensure
#     conn.close
#   end
# end

get '/actors' do
  begin
    conn = PG.connect(dbname: 'movies')
    @actors =  conn.exec('SELECT * FROM actors')
  ensure
    conn.close
  end
  erb :actors
end
