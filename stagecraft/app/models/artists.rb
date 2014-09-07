require 'nokogiri'
require 'open-uri'

# class Artist < ActiveRecord::Base
	#parse through billboard 100 and get all artists
	@artist_list = []
	url = "http://www.billboard.com/rss/charts/hot-100"
	doc = Nokogiri::XML(open(url))
	

	#sanatize results for commas and featured artist
	doc.xpath("//artist").each do |artist|
		@artist_list << artist.text.split(/Featuring|,|&|Duet/)[0]
	end

	#make sure all entries are unique
	@artist_list = @artist_list.uniq
	puts @artist_list


# end

