Rails.application.routes.draw do
  resources :students
  resources :subjects
  resources :books
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teachers#index'

  get 'locales/:part/:locale' => 'translations#show', as: :locales

  get 'templates/:name' => 'templates#show'
  get 'templates/:prefix/:name' => 'templates#show', as: :template
end
