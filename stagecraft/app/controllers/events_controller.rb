class EventsController < ApplicationController

	def index
	  
		@events = Event.event_search
	end

	def new 

	end

	def show 

	end

	def update

	end

end