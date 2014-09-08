class Event < ActiveRecord::Base
	belongs_to :artist, :venue

end