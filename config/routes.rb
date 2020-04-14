Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :user_scores
  resources :quizzes
  resources :users
  post "/auth", to: "auth#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
