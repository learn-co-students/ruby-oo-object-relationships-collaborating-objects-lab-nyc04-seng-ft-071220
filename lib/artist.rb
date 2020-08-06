require "pry"

class Artist

    attr_accessor :name, :songs
    @@all = []
    def initialize(name) 
        @name = name
        save
    end

    def songs
        Song.all.select {|song| song.artist == self}    
    end

    def add_song(song)
        song.artist = self
    end
    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        instance = self.all.find {|instance|instance.name == name}

        if instance
            instance
        else
            self.new(name)
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end