class Event < ActiveRecord::Base
	belongs_to :artist
	belongs_to :venue

	def self.get_id 

		@artist_search = 'deorro'
		url = "http://api.songkick.com/api/3.0/search/artists.xml?query=#{@artist_search}&apikey=8NUIdWtGgpjrPbIx"
		doc = Nokogiri::HTML(open(url))
		@id = doc.at_css('artist/@id')
		return @id
	end

	#searches for artist upcoming events
	def event_search
		events_url = "http://api.songkick.com/api/3.0/artists/#{@id}/calendar.xml?apikey=8NUIdWtGgpjrPbIx"
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
	def search(search)
		puts search
	end

end