class ArtistsController < ApplicationController

	def index
		@artists = Artist.clean_list
	end

	def new 

	end

	def show 
		@artists = Artist.find(params[:search])
	end

	def update

	end
end