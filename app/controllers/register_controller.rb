class RegisterController < ApplicationController
	def index
		@users = User.all
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/main'
		else
			redirect_to '/'
		end
	end

	private 

		def user_params
			params.require(:user).permit(:account, :password)
		end
end
