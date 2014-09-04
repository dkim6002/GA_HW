class Purchase < ActiveRecord::Base
	belongs_to :user
	belongs_to :song

	validates :song_id, uniqueness: {scope: :user_id}
	validates :song_id, :user_id, presence: true
end