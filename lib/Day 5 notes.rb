
#Belongs to
class Animal

	attr_accessor :species, :zoo

	@@all = []

	def initialize(species, zoo)
		@species = species
		@zoo = zoo
	end

	def self.create(species)
		self.new(species).save
	end

	def save
		self.class.all << self
		self
	end

	def self.all
		@@all
	end

end

#has many
class Zoo

	attr_accessor :name
	@@all = []

	def initialize(name)
		@name = name
	end

	def self.create(name)
		self.new(name).save
	end

	def save
		self.class.all << self
		self
	end

	def self.all
		@@all
	end

	def animals
		Animal.all.select { |animal| animal == self}
	end

end




class Picture

	attr_accessor :likes, :subject

	@@all = []

	def initialize(subject)
		@subject = subject
		@likes = []
	end

	def self.all
		@@all
	end

	def likes
		Like.all.select do |like|
			like.user == self
		end
	end

	def liked_pictures
		self.likes.map do |like|
			like.picture
		end
	end

end


class User

	def initialize(name)
		@name = name
		@pictures_liked = []
	end
	
	def pic_liked
		@pictures_liked
	end
end


class Likes
	attr_accessor :picture, :user

	def initialize(picture, user)
		@picture = picture
		@user = user
		
		@picture.likes << self.user
		@user.pic_liked << self.picture
	end

end


cute_dog = Picture.new("dog")
luke = User.new("Luke")
lauren = User.new("Lauren")

like_pic = Likes.new(cute_dog, luke)
like_pic = Likes.new(cute_dog, lauren)

puts luke.pic_liked[0].subject

puts cute_dog.likes.name
