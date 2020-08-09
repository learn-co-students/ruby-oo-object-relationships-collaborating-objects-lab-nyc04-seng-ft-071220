class Artist

    attr_accessor :name

    @@all = []

    def initialize(artist_name)
        @name = artist_name
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

    def add_song(song)
        song.artist = self
    end 

    def self.find_or_create_by_name(name)
       finder = self.all.find do |artist|
            artist.name == name
        end 
        if !finder
            finder = self.new(name)
        end
        finder
    end 

    def print_songs
        songs.each do |song|
            puts song.name
        end 
        
    end


end 
