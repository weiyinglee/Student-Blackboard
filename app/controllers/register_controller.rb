class RegisterController < ApplicationController
	def index
		
		#check if the user is already login in
		if session[:user_id]
			redirect_to '/main'
		end

		@users = User.all
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if params[:account] != "" && params[:password] != ""

			if @user.save
				session[:user_id] = @user.id
				redirect_to '/main'
			else
				session[:error] = true
				redirect_to '/register'
			end
		else
			session[:empty_err] = true
			redirect_to '/register'
		end

	end

	private 

		def user_params
			params.require(:user).permit(:account, :password, :password_confirmation)
		end
end
