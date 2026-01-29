require 'sqlite3'
require_relative '../config'

class Seeder

  def self.seed!
    puts "Using db file: #{DB_PATH}"
    puts "🧹 Dropping old tables..."
    drop_tables
    puts "🧱 Creating tables..."
    create_tables
    puts "🍎 Populating tables..."
    populate_tables
    puts "✅ Done seeding the database!"
  end

  def self.drop_tables
    db.execute('DROP TABLE IF EXISTS movies')
  end

  def self.create_tables
    db.execute('CREATE TABLE movies (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                poster TEXT NOT NULL,
                runtime TEXT NOT NULL,
                imdb TEXT NOT NULL
                )')
  end

  def self.populate_tables
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Star Wars Revenge of the Sith", "https://storage.googleapis.com/pod_public/1300/266305.jpg", "2h 20m", "8,8")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("The Lord of the Rings: The Return of the King", "https://static.posters.cz/image/1300/133052.jpg", "3h 21m", "9,0")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Inception", "https://m.media-amazon.com/images/I/91b3Xtjt0IL._AC_UF1000,1000_QL80_.jpg", "2h 28m", "8,8")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("The Matrix", "https://m.media-amazon.com/images/I/51EG732BV3L._AC_.jpg", "2h 16m", "8,7")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Interstellar", "https://m.media-amazon.com/images/I/61ASebTsLpL._AC_UF894,1000_QL80_.jpg", "2h 49m", "8,6")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Avatar", "https://i.pinimg.com/736x/8b/2f/a6/8b2fa6fb94810cd0d335b479896f7fc8.jpg", "2h 42m", "7,9")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Guardians of the Galaxy", "https://m.media-amazon.com/images/I/81YZ8slCyuL.jpg", "2h 1m", "8,0")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Mad Max: Fury Road", "https://m.media-amazon.com/images/I/71rs1WWtoBL._AC_UF1000,1000_QL80_.jpg", "2h 0m", "8,1")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Dune: Part One", "https://i0.wp.com/schicksalgemeinschaft.wordpress.com/wp-content/uploads/2021/09/dune-part-one-poster.jpg?fit=810%2C1200&ssl=1", "2h 35m", "8,0")')
    db.execute('INSERT INTO movies (name, poster, runtime, imdb) VALUES ("Pirates of the Caribbean: The Curse of the Black Pearl", "https://m.media-amazon.com/images/I/71zji3aER6L.jpg", "2h 23m", "8,1")')
  end

  private

  def self.db
    @db ||= begin
      db = SQLite3::Database.new(DB_PATH)
      db.results_as_hash = true
      db
    end
  end

end

Seeder.seed!