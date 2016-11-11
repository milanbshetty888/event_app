class EventsController < ApplicationController

	def new
		# binding.pry
		@event1 = Event.all
		@user = User.find_by_id(params[:user_id])
		@var = @user.fname
	end

	def create
		@event = Event.new(event_params)
		@event.save
		redirect_to event_new_path
	end

	def event
		@event = Event.new(event_params)
	end

	def update
		# binding.pry
		@event = Event.find_by_id(params[:id])
		@event.update_attributes(event_params)
		redirect_to event_new_path
	end

	private
	def event_params
		params.require(:event).permit(:title, :venue, :date, :time, :description, :invitees, :status)
	end
end