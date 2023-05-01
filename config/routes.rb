Rails.application.routes.draw do
  devise_for :users

  resources :vacancies, only: %i[index show]

  root 'vacancies#index'
end
