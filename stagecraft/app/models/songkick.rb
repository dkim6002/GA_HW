require 'nokogiri'
require 'open-uri'

class SongKick #< ActiveRecord::Base

	#Search songkick api for artist id
	@artist_search = 'deorro'
	url = "http://api.songkick.com/api/3.0/search/artists.xml?query=#{@artist_search}&apikey=8NUIdWtGgpjrPbIx"
	doc = Nokogiri::HTML(open(url))
	@artist_id = doc.at_css('artist/@id')

	#searches for artist upcoming events
	events_url = "http://api.songkick.com/api/3.0/artists/#{@artist_id}/calendar.xml?apikey=8NUIdWtGgpjrPbIx"
	events_doc = Nokogiri::HTML(open(events_url))
	events_doc.css('event').each do |events|
		type = events.at_css('@type')
		location = events.at_css('location/@city')
		date = events.at_css('start/@date')
		time = events.at_css('start/@time')
		venue = events.at_css('venue/@displayname')
		puts "#{type}, #{location}, #{date}, #{time}, #{venue}"
	end
	
	 # puts events_doc.css('event')

end