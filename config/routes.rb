Rails.application.routes.draw do
  devise_for :users

  resources :vacancies, only: %i[index show]
  resources :candidacies, only: %i[create]
  get 'users/show'

  root 'vacancies#index'
end
