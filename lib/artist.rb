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
        Song.all.select do |song|
            song.artist == self
        end
    end

        #song = song instance
    def add_song(song)
        song.artist = self
    end
    
        #found = artist instance
    def self.find_or_create_by_name(artist_name)       
        found = Artist.all.find do |artist_list|
            artist_list.name == artist_name  
        end
        !found ? Artist.new(artist_name) : found 
    end

    def print_songs
        self.songs.each do|song|
            puts song.name
        end
    end

end