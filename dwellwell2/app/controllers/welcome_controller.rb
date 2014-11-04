class WelcomeController < ApplicationController
	def index
		if current_user == nil
		elsif current_user.house_key != nil
			redirect_to ('/houses/' + current_user.house_key)
		end
	end
end