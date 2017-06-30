require "pry"
class Song

	attr_accessor :name, :artist

	def initialize(name)
		@name = name
	end

	

	def self.new_by_filename(file)
		file_artist = file.split(" - ")[0]
		file_title = file.split(" - ")[1]
		song = Song.new(file_title)
		appended_artist = Artist.find_or_create_by_name(file_artist)
		appended_artist.add_song(song)
		song.artist = appended_artist
		song
	end

end