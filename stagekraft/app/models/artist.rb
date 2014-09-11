require 'nokogiri'
require 'open-uri'
require 'mongoid'

class Artist
  include Mongoid::Document
  field :name, type: String

  embeds_many :events
  has_and_belongs_to_many :venues

 

  def self.add_artist
  	 @name = []
     url = "http://www.billboard.com/rss/charts/hot-100"
	 doc = Nokogiri::XML(open(url))
		
	 doc.xpath("//artist").each do |artist|
	    @name << artist.text.split(/Featuring|,|&|Duet/)[0]
	 end
	 @name = @name.uniq!
	 Artist.create(:name => @name)

  end



end


