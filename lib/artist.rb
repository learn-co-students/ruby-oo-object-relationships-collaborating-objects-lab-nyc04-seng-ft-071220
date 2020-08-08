require 'pry'

class Artist

    attr_accessor :name 

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all 
    end

    def songs 
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song_name)
        # This instance method exists to tell a passed in `Song` instance it belongs to
        # _this_ `Artist` instance.
        song_name.artist = self
        # binding.pry
    end

    def self.find_or_create_by_name(artist_name_string)
        if self.all.find { |artist| artist.name == artist_name_string}
            self.all.find { |artist| artist.name == artist_name_string}
        else
            Artist.new(artist_name_string)
        end
    end

    def print_songs 
        songs = Song.all.find_all { |song| song.artist == self }
        songs.each { |song| puts song.name }
        # had to use puts so each song.name appeared on seperate lines. tripped me up.
    end
end
# binding.pry