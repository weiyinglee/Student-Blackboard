Rails.application.routes.draw do
	get "/register", to: "register#index"
	get "/main", to: "main#index", as: "main"
	post "/register", to: "register#create"
	post "/", to: 'login#create'
	get "/logout", to: "login#destroy"

	root "login#index"
end
