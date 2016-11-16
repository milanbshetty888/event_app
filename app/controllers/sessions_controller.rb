class SessionsController < ApplicationController

def new

end
	def create
		# binding.pry
		user = User.find_by_username(params[:username])
		# If the user exists AND the password entered is correct.
		if user && user.authenticate(params[:password])
		  # Save the user id inside the browser cookie. This is how we keep the user 
		  # logged in when they navigate around our website.
		  session[:user_id] = user.id
		  redirect_to event_new_path(user.id)
		else
			flash[:error] = "username or password invalid"
	# If user's login doesn't work, send them back to the login form.
			redirect_to '/'
		end
	end

	def edit
		# binding.pry
		# @user = Event.find_by_id(params[:user_id])
		@user1 = User.find_by_id(params[:user_id])
	end

	def update
		# binding.pry
		@user = User.find_by_id(params[:user_id])
		@user.update_attributes(user_params)
		redirect_to event_new_path

	end

	def destroy
		session[:user_id] = nil
		redirect_to home_path
	end

	private 
	def user_params
		params.require(:user1).permit(:fname, :lname, :email, :phoneno)
	end
end
