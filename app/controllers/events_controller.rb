class EventsController < ApplicationController

	def new
		# binding.pry
		@current_user = User.find(session[:user_id])
		@invitation = Invitation.all
		@user = User.all
		@event1 = Event.all
		@event2 = Event.all
		# @event2 = Event.find_by_id(params[:id])
		# @user = User.find_by_id(params[:user_id])
		# @var = @user.fname
	end

	def create
		# binding.pry
		@event = Event.new(event_params)
		@event.user_id = User.find(session[:user_id]).id
		@event.save

		params[:role_ids].each do |val|
			@invitation = Invitation.new
			@invitation.event_id = Event.last.id
			@invitation.invitee_id = @event.user_id
			@invitation.inviter_id = val
			@invitation.save
		end
		# binding.pry
		redirect_to event_new_path
	end

	def edit
		# binding.pry
		# @invitation = Invitation.all
		# @current_user = User.find(session[:user_id])
		@user = User.all
		@current_user1 = User.find(session[:user_id])
		@event = Event.find_by_id(params[:user_id])
		#@events= Event.find_by_id(params[:user_id])

		# @event1 = Event
	end

	def update
		# binding.pry
		@event = Event.find_by_id(params[:user_id])
		@event.update_attributes(event_params)

		# binding.pry
		if params[:role_ids] != nil
		params[:role_ids].each do |val|
			@invitation = Invitation.new
			@invitation.event_id = @event.id
			@invitation.invitee_id = @event.user_id
			@invitation.inviter_id = val
			@invitation.save
		end
	end

		redirect_to event_new_path
	end
	
	def show
		# binding.pry
		@event = Event.find_by_id(params[:id])
	end

	private
	def event_params
		params.require(:event).permit(:title, :venue, :date, :time, :description, :invitees, :status)
	end
end