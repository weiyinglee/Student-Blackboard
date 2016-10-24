Rails.application.routes.draw do
	get "/register", to: "register#index"
	get "/main", to: "main#index"

	root "login#index"
end
