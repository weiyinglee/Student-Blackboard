Rails.application.routes.draw do
	get "/register", to: "register#index"
	get "/main", to: "main#index", as: "main"
	get "/main/class_schedule", to: "main#schedule", as: "schedule"
	get "/main/personal_note", to: "main#note", as: "note"
	get "/main/gpa_calculator", to: "main#calculator", as: "calculator"

	post "/register", to: "register#create"
	post "/", to: "login#create"
	post "/main/class_schedule", to: "main#schedule_create"
	
	get "/logout", to: "login#destroy"

	root "login#index"
end
