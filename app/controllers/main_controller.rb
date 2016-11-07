class MainController < ApplicationController
	#check before rendering action
	before_action :check_login, only: [:index, :schedule, :note, :calculator]

	def index
		@user = load_user
	end

	def schedule
		@user = load_user
	end

	def schedule_create
	end

	def note
		@user = load_user
	end

	def calculator
		@user = load_user
	end

	private
		#check if the user logged in
		def check_login
			if session[:user_id] == nil
				redirect_to '/'
			end
		end

		#load the user info
		def load_user
			User.find_by_id(session[:user_id])
		end
end
