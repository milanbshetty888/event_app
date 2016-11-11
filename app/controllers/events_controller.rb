class EventsController < ApplicationController

	def new
		# binding.pry
		@event1 = Event.all
		@event2 = Event.find_by_id(params[:id])
		@user = User.find_by_id(params[:user_id])
		@var = @user.fname
	end

	def create
		# binding.pry
		@event = Event.new(event_params)
		@event.user_id = User.find_by_id(params[:user_id]).id
		@event.save
		redirect_to event_new_path
	end

	def edit
		# binding.pry
		@event = Event.find_by_id(params[:id])
	end

	def update
		# binding.pry
		@event = Event.find_by_id(params[:id])
		@event.update_attributes(event_params)
		redirect_to event_new_path
	end
	
	def show
		# binding.pry
		@event1 = Event.find_by_id(params[:id])
	end

	private
	def event_params
		params.require(:event).permit(:title, :venue, :date, :time, :description, :invitees, :status)
	end
end