require 'pry'
class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(song_name)
        @name = song_name
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        song_name = parts[1]
        song_artist = parts[0]
            # binding.pry
        new_song = self.new(song_name)
        new_song.artist_name = song_artist
        new_song  
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end 

end 
