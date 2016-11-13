class MainController < ApplicationController
	#check before rendering action
	before_action :check_login, only: [:index, :schedule, :note, :calculator]

	# GET for main menu page
	def index
		@user = load_user
		@schedules = Schedule.all
		@notes = Note.all
	end

	# GET for class schedule page
	def schedule
		@user = load_user
		@schedules = Schedule.all
		@schedule = Schedule.new
	end

	# POST for class schedule
	def schedule_create
		@schedule = Schedule.new(schedule_params)

		if params[:schedule][:professor] != "" && 
			params[:schedule][:classname] != "" &&
			params[:schedule][:classroom] != "" &&
			params[:schedule][:day] != "" 
			params[:schedule][:hour] != "" &&
			params[:schedule][:minute] != "" &&
			params[:schedule][:hour_end] != "" &&
			params[:schedule][:minute_end] != ""

			if @schedule.save
				redirect_to '/main/class_schedule'
			else
				#show error message
				session[:error] = true
				redirect_to '/main/class_schedule'
			end
		else
			#handle error message here
			session[:empty_err] = true
			redirect_to '/main/class_schedule'
		end
	end

	# DELETE for class schedule
	def schedule_destroy
		@schedule = Schedule.find(params[:schedule][:id])
		@schedule.destroy
		redirect_to '/main/class_schedule'
	end

	# GET for personal note page
	def note
		@user = load_user
		@notes = Note.all
		@note = Note.new
	end

	# Create a new row in Note tables
	# POST(create) for class note. When you click "Submit"
	def note_create
		@note = Note.new(note_params)

		if @note.save
			redirect_to '/main/personal_note'
		else
			#handle error message here
			redirect_to '/main/personal_note'
		end
	end

	# DELETE for class note
	def note_destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to '/main/personal_note'
	end



	# GET for gpa calculator page
	def calculator
		@user = load_user
	end

	'''
	other private helper methods
	'''
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

		#permission for POST
		def schedule_params
			params.require(:schedule).permit(:user, :professor, :classname, :classroom, :day, :hour, :minute, :hour_end, :minute_end)
		end

		def note_params
			params.require(:note).permit(:user,:month, :day, :content)
		end

end
