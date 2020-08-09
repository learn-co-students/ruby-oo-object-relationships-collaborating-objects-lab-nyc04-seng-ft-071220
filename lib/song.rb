class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

        #return song instance
    def self.new_by_filename(file_name)
        file_name_array = file_name.delete_suffix(".mp3").split(" - ")
        song = Song.new(file_name_array[1])
        song.artist = Artist.new(file_name_array[0])
        song
    end

    def artist_name= (artist_name)
        artist_ins = Artist.find_or_create_by_name(artist_name)
        artist_ins.add_song(self)
    end


end
