Rails.application.routes.draw do
  devise_for :users

  resources :vacancies, only: %i[index show]
  resources :candidacies, only: %i[index show create]

  root 'vacancies#index'
end
