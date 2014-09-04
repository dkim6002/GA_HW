class Song < ActiveRecord::Base
	has_many :purchases
	belongs_to :artist
	has_many :users, through: :purchases

	validates :title, :price, presence: true

end