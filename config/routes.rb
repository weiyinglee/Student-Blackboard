Rails.application.routes.draw do

	# GET
	get "/register", to: "register#index"
	get "/main", to: "main#index", as: "main"
	get "/main/class_schedule", to: "main#schedule", as: "schedule"
	get "/main/personal_note", to: "main#note", as: "note"
	get "/main/gpa_calculator", to: "main#calculator", as: "calculator"

	# POST
	post "/register", to: "register#create"
	post "/", to: "login#create"
	post "/main/class_schedule", to: "main#schedule_create"
	
	# DELETE (for convenience, using GET method instead)
	get "/logout", to: "login#destroy"
	get "/main/class_schedule/:id", to: "main#schedule_destroy"

	root "login#index"
end
