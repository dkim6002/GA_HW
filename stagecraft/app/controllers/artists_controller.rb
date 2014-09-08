class ArtistsController < ApplicationController

	def index
		@artists = Artist.clean_list
	end

	def new 

	end

	def show 

	end

	def update

	end
end