require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        # binding.pry
        # test_music_path = "./spec/fixtures/mp3s"
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end 

    def import 
        # binding.pry
        # Song.rb method 
        files.each do |filename|
            Song.new_by_filename(filename)
        end
    end 
        
end 