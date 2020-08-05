# Build an MP3Importer class that parses a directory of files and sends the filenames to a song class 
# to create a library of music with artists that are unique. 
# To do this, you'll need two methods: Mp3Importer#files and MP3Importer#import. 
# Your MP3Importer class should also have a path attribute that gets set on initialization.

# You should write code that responds to MP3Importer.new('./spec/fixtures').import. #path
# Google around for how to get a list of files in a directory! Make sure you only get .mp3 files.

# Since we have to send the filenames to the Song class, 
# we'll end up calling the following code in the #import method: Song.new_by_filename(some_filename). 
# This will send us to the Song class, specifically Song.new_by_filename and 
# handle the creation of Song instances and their associated Artist instances.

class MP3Importer

    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
  
    def import
      files.each{|f| Song.new_by_filename(f)}
    end

  end