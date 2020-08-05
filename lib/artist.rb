# The Artist class will be responsible for either creating the artist 
# (if the artist doesn't exist in our program yet) or 
# finding the instance of that artist (if the artist does exist).

# An Artist be initialized with a name and should have 
# an attribute accessor for this name. 
# The class should have an @@all class variable and 
# store all Artist instances in this variable.

class Artist

    attr_accessor :name, :songs
  
    @@all = []
  
    def initialize(name)
      @name = name
      save
    end
  
    # Artist.all. This class method should return all Artist instances.

    def self.all
      @@all    
    end
  
    # Artist.add_song. This instance method exists to tell a pased in Song instance 
    # it belongs to this Artist instance.
    
    def add_song(song)
      song.artist = self
    end
  
    # Artist.songs. This instance method returns an Array of all songs 
    # that belong to this Artist instance. 
    # This method should get all existing Song instances from Song 
    # and select only the ones that are associated with this Artist instance.
    
    def songs
      Song.all.select {|song| song.artist == self}
    end

    # Artist.find_or_create_by_name. This class method should take the name 
    # that is passed in (remember, it will be a string), and do one of two things. 
    # Find the artist instance that has that name or create one if it doesn't exist. 
    # Either way, the return value of the method will be an instance of an artist 
    # with the name attribute filled out.

    def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.new(name) #ternary!
    end
  
    # Artist#print_songs. This instance methods outputs the names 
    # of all songs associated with this Artist instance.

    def print_songs
      songs.each {|song| puts song.name}
    end

    def self.find(name)
      self.all.find {|artist| artist.name == name}
    end
  
    def save
      @@all << self
    end
  

  end