class App < Sinatra::Base

  
  def db
    return @db if @db

    @db = SQLite3::Database.new("db/sqlite.db")
    @db.results_as_hash = true

    return @db
  end

  # Routen /
  get '/' do
    redirect(:"/movies")
  end

  get '/movies' do
    @movies = db.execute('SELECT * FROM movies')
    p @movies
    erb(:"movies/index")
  end
  

  get '/movies/new' do
    erb(:"movies/new")
  end

  post '/movies' do
    db.execute("INSERT INTO movies (name, poster, runtime, imdb) Values(?,?,?,?)", params.values)
    redirect('/')
  end

  get '/movies/:id' do | id |
    @movie = db.execute('SELECT * FROM movies WHERE id=?',id).first
    erb(:"movies/show")
  end

  post '/movies/:id/delete' do | id |
    db.execute("DELETE FROM movies WHERE id =?", id)
    redirect("/")
  end

  get '/movies/:id/edit' do | id |
    @movie = db.execute('SELECT * FROM movies WHERE id=?',id).first
    erb(:"movies/edit")
  end

  post "/movies/:id/update" do | id |
    db.execute("UPDATE movies SET name=?, poster=?, runtime=?, imdb=? WHERE id=?", params.values)
    redirect("/")
  end

end