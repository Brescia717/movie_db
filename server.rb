require  'sinatra'
require  'sinatra/reloader'
require  'pg'
require  'pry'

log = []

get '/' do
  begin
    conn = PG.connect(dbname: 'movies')
    log = conn.exec('SELECT * FROM movie_log').to_a
  ensure
    conn.close
  end
  redirect '/actors'
end


get '/actors' do
  @actors = []
  @actor_id = []
  log.each  do |movies|
    @actors << movies["name"]
    @actor_id << movies["actor_id"]
  end

  @actors = @actors.uniq.sort
  @actor_id = @actor_id.uniq
  erb :actors
end


get '/actors/:id' do
  @movies = []
  @movies = log.find_all{|movie_log| movie_log["actor_id"] == params[:id]}
  @movies
  erb :actor_info
end


get '/movies' do
  @movies = []
  log.each {|movie_log| @movies << movie_log["title"]}
  @movies = @movies.uniq
  erb :movies
end


get '/movies/:title' do
  @movies = []
  @movies = log.find_all{|movie_log| movie_log["title"] == params[:title]}
  @movies
  erb :movie_info
end




