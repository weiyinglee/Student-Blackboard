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
		@schedule = Schedule.find(params[:id])
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

		@schedules = Schedule.all
		@total_grades = 0
		@schedules.each do |s|
		if s.user == @user.account
				@total_grades = @total_grades + 1
			end
		end
		@numbered_grades = []
		@total = 0.0
		@gpa = 0.0
		(0..(@total_grades - 1)).each do |i|
			@numbered_grade = convert_to_number(params[:"grade#{i}"])
			@numbered_grades << @numbered_grade
			@total = @total + @numbered_grade
		end
		@gpa = @total / @total_grades
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
		
		#convert letter grade to number
		def convert_to_number(letter_grade)
			grade = 0;
			case letter_grade
			when "A"
				grade = 4.0
			when "A-"
				grade = 3.7
			when "B+"
				grade = 3.3
			when "B"
				grade = 3.0
			when "B-"
				grade = 2.7
			when "C+"
				grade = 2.3
			when "C"
				grade = 2.0
			when "C-"
				grade = 1.7
			when "D"
				grade = 1.0
			when "F"
				grade = 0.0
			else
				puts " "
			end

			return grade
		end

end
