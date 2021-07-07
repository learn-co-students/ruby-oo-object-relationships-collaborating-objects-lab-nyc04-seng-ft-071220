class Artist
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song_instance)
    song_instance.artist = self
  end
  
  def songs
    all_my_songs = Song.all.select do|song_instance|
    song_instance.artist == self
    end
    all_my_songs
    #binding.pry
  end
  
  
  def self.find_or_create_by_name(name)
    found_artist = self.all.find do |artist_instance|
      artist_instance.name == name
    end
    
    if !found_artist
      found_artist = Artist.new(name)
    end
    
    found_artist
  end
  
  def print_songs
    all_my_songs = self.songs
    song_names = all_my_songs.map{|song|song.name}
    song_names.each{|song_name|puts song_name}
  end
  
  
end


