class Puppy <ActiveRecord::Base
	has_many :bones, :dependent => :destroy

	validates :name, length: { minimum: 3 }
	validates :age, numericality: {less_than_or_equal_to: 3 }
	validates :img_url, presence: true

	before_validation :default_img
	after_save :norm_puppy

	protected

		def default_img
			self.img_url = "https://my.vetmatrixbase.com/clients/12679/images/Gorgeous_puppies.jpg" if img_url.empty?
		end

		def norm_puppy
			self.clean = true if clean != true
		end

end