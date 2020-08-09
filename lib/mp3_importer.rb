class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        # Returns an array containing all of the filenames 
        # except for “.” and “..” in the given directory.
        Dir.children(self.path)
    end

    def import
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end

end







# def file
    # allfile_array = Dir.entries(self.path)
    # allfile_array.select { |file| file.include? (".mp3") }
# end