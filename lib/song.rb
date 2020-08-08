require 'pry'

class Song

    attr_accessor :name, :artist
    
    @@all = []

    def initialize(song_name)
        @name = song_name
        @artist = artist
        @@all << self
    end

    def self.all 
        @@all 
    end

    def artist_name=(artist_str)
        artist_instance = Artist.find_or_create_by_name(artist_str)
        artist_instance.add_song(self)
    end


    def self.new_by_filename(filename)
        song_str = filename.split(" - ")[1]
        artist_str = filename.split(" - ")[0]
        new_song = Song.new(song_str)
        new_song.artist_name = artist_str
        # setter method artist_name above helps find or create artist instance to assign to 
        # new_song instance. add_song method helps assign the artist to the song.
        new_song
        # binding.pry
    end

end

# binding.pry