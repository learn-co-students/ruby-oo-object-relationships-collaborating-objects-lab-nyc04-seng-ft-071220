require 'pry'

class Artist

    attr_reader :name, :song

    @@all =[]

    def initialize(name)
        @name=name
        @@all << self
    end

    def name=(name)
        @name =name
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
        # binding.pry
    end

    def add_song(name)
        name.artist =self
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find{|artist| artist.name == name }
    end

    def print_songs
        songs.each{|song| puts song.name}
    end

end