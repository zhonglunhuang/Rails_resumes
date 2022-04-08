Rails.application.routes.draw do
  # get '/' , to: "index#index"
  root "index#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resumes"
end
