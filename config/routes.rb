Rails.application.routes.draw do
  resources :postings
  devise_for :users

    # Defines the root path route ("/")
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/about'
  get 'home/register'
  get 'property/browse'
  get 'property/rent'
  get 'postings/index'
  get 'property/details'

end
