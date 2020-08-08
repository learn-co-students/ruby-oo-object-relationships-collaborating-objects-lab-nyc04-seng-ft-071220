require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        filenames = Dir.entries(self.path)
        filenames[2..filenames.size]
        # binding.pry
    end

    def import
        self.files.each { |filename| Song.new_by_filename(filename) }
        # binding.pry
    end

end