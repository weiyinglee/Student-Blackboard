class LoginController < ApplicationController
	def index
	end

	def create
		@user = User.find_by_account(params[:login][:account])
		if @user && @user.authenticate(params[:login][:password])
			session[:user_id] = @user.id
			redirect_to '/main'
		else
			redirect_to '/'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end
end
