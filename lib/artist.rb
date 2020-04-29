class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_song(name, genre)
    #creates a new song & knows it belongs to an artist
    Song.new(name, self, genre)
  end

  def songs
    #iterates through all songs and finds the songs that belong to that artist
    Song.all.select {|song| song.artist == self}
  end

  def genres
    #iterates over that artist's songs and collects the genre of each song
    self.songs.map {|song| song.genre}
  end
end
