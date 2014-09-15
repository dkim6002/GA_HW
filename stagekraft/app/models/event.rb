require 'open-uri'
require 'nokogiri'

class Event
  include Mongoid::Document
  field :date, type: Date
  field :time, type: Time
  field :type, type: String

  embedded_in :artist
  has_one :venue
  
  #figure out how to loop through billboard 100 artist list
	#Search songkick api for artist id
	def self.get_id(name) 

		@artist_search = name.gsub(' ','?')
		url = "http://api.songkick.com/api/3.0/search/artists.xml?query=#{@artist_search}&apikey=8NUIdWtGgpjrPbIx"
		doc = Nokogiri::HTML(open(url))
		@id = doc.at_css('artist/@id')
		return @id
	end

	#searches for artist upcoming events
	def self.event_search
		results = []
		events_url = "http://api.songkick.com/api/3.0/artists/#{@id}/calendar.xml?apikey=8NUIdWtGgpjrPbIx"
		events_doc = Nokogiri::HTML(open(events_url))
		events_doc.css('event').each do |events|
			type = events.at_css('@type')
			location = events.at_css('location/@city')
			date = events.at_css('start/@date')
			time = events.at_css('start/@time')
			venue = events.at_css('venue/@displayname')
			results << "#{type}, #{location}, #{date}, #{time}, #{venue}"
		end
		return results
	end
end
