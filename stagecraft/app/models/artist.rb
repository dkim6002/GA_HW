require 'nokogiri'
require 'open-uri'
# require 'csv'

class Artist < ActiveRecord::Base
	has_many :events
	has_many :venues, :through => :events

	#parse through billboard 100 and get all artists
	def self.get_list
		@artist_list = []
		url = "http://www.billboard.com/rss/charts/hot-100"
		doc = Nokogiri::XML(open(url))
		
		doc.xpath("//artist").each do |artist|
			@artist_list << artist.text.split(/Featuring|,|&|Duet/)[0]
		end
		return @artist_list
	end

	#sanatize list
	def self.clean_list
		#make sure all entries are unique
		@list = Artist.get_list.uniq
		return @list
		
	end
	# def self.save
	# 	CSV.open("/Users/DK/dev/wdi/stagecraft/lib/tasks/file.csv", "wb") do |csv|
	# 		csv << "#{@list}"
	# 	end
	# end	

end
# p = Artist.new
# puts Artist.clean_list



