require 'ransack'
class ArtistsController < ApplicationController

	def index
		# q = params[:q]
		@artists = Artist.find(params[:q])
		# @events = Event.search(name_cont: q).result
		# @venue = Venue.search(name_cont: q).result
	end
	def new 
	end

	def search 
		@artists = Artist.get_list
		@artists = @artists.find(params[:search])
	end

	def show 
		@artist = Artist.new
	end

	def update

	end
end