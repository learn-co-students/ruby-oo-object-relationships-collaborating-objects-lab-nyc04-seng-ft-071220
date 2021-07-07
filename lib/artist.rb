class Artist

    @@all=[]



 attr_accessor :name

    def initialize(name_arg)
        @name=name_arg
        @@all<<self
    end



    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist==self}
    end

    def add_song(song)
        song.artist=self
    end

    def self.find_or_create_by_name(name)
        song = self.all.find {|artist| artist.name == name}
        if song
            song
        else
            new_artist= self.new(name)
            new_artist
        end
    end


    
  def print_songs
    songs.each {|song| puts song.name}
  end

end