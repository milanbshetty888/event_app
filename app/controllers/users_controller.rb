class UsersController < ApplicationController
	def home

	end

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to login_path
		else
			redirect_to user_signin_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:fname, :lname, :username, :email, :phoneno, :role, :password, :password_confirmation)
	end
end
