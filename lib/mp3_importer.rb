require "pry"
class MP3Importer
  #class variable to store all my mp3 instances
  @@all = []
  
  attr_accessor :path, :files
  
  def initialize(file_path)
    @path = file_path
    @files = nil
  end
  
  def files #loads all the files with mp3 as an extension in the path directory
   my_files = Dir.entries("#{self.path}").select do |file|
      file.include?("mp3")
     #binding.pry
     end #this should give me an array of all the files inside
  my_files
  end

  def import
    self.files.each do |mp3_file|
    filename = Song.new_by_filename(filename)
    end
  end
  
  # def self.new_by_filename(filename)
  #   # binding.pry
  #   # parsed_file_name = filename.split("-")
  #   # Song.new(parsed_file_name[1])
  # end


end #end of class defintion