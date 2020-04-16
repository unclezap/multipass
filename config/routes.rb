Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :user_scores
  resources :quizzes
  resources :users
  post '/auth', to: "auth#create"
  get '/current_user', to: 'auth#show'
  get '/user_scores/users/:id', to: "user_scores#by_user"
  get '/user_scores/quizzes/:id', to: "user_scores#by_quiz"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
