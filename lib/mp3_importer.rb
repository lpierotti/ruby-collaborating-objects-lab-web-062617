require "pry"
class MP3Importer

	attr_accessor :path 

	def initialize(path)
		@path = path
	end

	
	def files
		 Dir.entries(@path).select { |f| !File.directory? f }
		 #binding.pry
	end

	def import
		self.files.map do |file_song|
			Song.new_by_filename(file_song)
		end

	end

end