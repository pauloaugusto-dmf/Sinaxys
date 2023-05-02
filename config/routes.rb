Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    root 'vacancies#index'

    devise_for :users

    resources :vacancies, only: %i[index show]
    resources :candidacies, only: %i[create]
    get 'users/show'
  end
end
