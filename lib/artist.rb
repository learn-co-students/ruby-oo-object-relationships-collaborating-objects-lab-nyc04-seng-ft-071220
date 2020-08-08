class Artist

    attr_accessor :name, :songs
    @@all = []

    def initialize(name_par)
        @name = name_par
        @@all << self
    end

    def self.all
        @@all
    end

    #returns an Array of all songs that belong to this Artist instance
    #should get all existing Song instances from Song and 
    #select only the ones that are associated with this Artist instance.
    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song_instance)
        song_instance.artist = self
    end

    #should take the name that is passed in
    #1. Find the artist instance that has that name
    #2. OR create one if it doesn't exist
    #the return value will be an instance of an artist with the name attribute filled out.
    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
      end
    
    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end