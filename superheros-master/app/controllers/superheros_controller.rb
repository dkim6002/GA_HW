class SuperherosController < ApplicationController

	def index
		@superheros = Superhero.all
	end

	def new
		@superhero = Superhero.new
	end

	def show
		@superhero = Superhero.find(params[:id])
	end


	def create
	end

	def update
		@superhero = Superhero.find(params[:id])
		if @superhero.update(superhero_params)
			redirect_to @superhero
		end
	end

	def destroy
		@superhero = Superhero.find(params[:id])
		@superhero.destroy
		redirect_to 
	end

	private

	def superhero_params
		params.require(:superhero).permit(:name, :image)
	end



end