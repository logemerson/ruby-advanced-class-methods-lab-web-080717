require'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name = "", artist_name = "")
    new_song = self.new
    new_song.name = song_name
    new_song.artist = artist_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist = split[0]
    song_name = split[1].split(".")[0]

    new_song = self.create_by_name(song_name, artist)
  end

  def self.create_from_filename(filename)
    split = filename.split(" - ")
    artist = split[0]
    song_name = split[1].split(".")[0]
    new_song = self.create_by_name(song_name, artist)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end
  
  def save
    self.class.all << self
  end

end
