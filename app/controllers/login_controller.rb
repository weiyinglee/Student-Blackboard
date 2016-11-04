class LoginController < ApplicationController
	def index
		if session[:user_id]
			redirect_to '/main'
		end
	end

	def create
		@user = User.find_by_account(params[:login][:account])
		if @user && @user.authenticate(params[:login][:password])
			session[:user_id] = @user.id
			redirect_to '/main'
		else
			#save the error message to session
			session[:error] = true
			redirect_to '/'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end
end
