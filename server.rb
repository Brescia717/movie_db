# require 'Gemfile'
require  'sinatra'
require  'sinatra/reloader'
require  'pg'
require  'pry'

get '/actors' do
  begin
    conn = PG.connect(dbname: 'movies')
    @actors =  conn.exec('SELECT * FROM actors')
  ensure
    conn.close
  end
  erb :actors
end

get '/actors/:id' do



end

