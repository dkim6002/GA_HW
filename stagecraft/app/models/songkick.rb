require 'nokogiri'
require 'open-uri'

class SongKick #< ActiveRecord::Base

	#figure out how to loop through billboard 100 artist list
	#Search songkick api for artist id
	def self.artist_id

		artist_search = 'deorro'
		url = "http://api.songkick.com/api/3.0/search/artists.xml?query=#{artist_search}&apikey=8NUIdWtGgpjrPbIx"
		doc = Nokogiri::HTML(open(url))
		id = doc.at_css('artist/@id')
		return id
	end

	#searches for artist upcoming events
	def event_search
		events_url = "http://api.songkick.com/api/3.0/artists/#{SongKick.artist_id}/calendar.xml?apikey=8NUIdWtGgpjrPbIx"
		events_doc = Nokogiri::HTML(open(events_url))
		events_doc.css('event').each do |events|
			type = events.at_css('@type')
			location = events.at_css('location/@city')
			date = events.at_css('start/@date')
			time = events.at_css('start/@time')
			venue = events.at_css('venue/@displayname')
			puts "#{type}, #{location}, #{date}, #{time}, #{venue}"
		end
	end
	p = SongKick.new
	p.event_search
	
	#sanitize location by city, state, county

	#sanitize military time to standard

end
