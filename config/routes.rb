Rails.application.routes.draw do
  resources :stocks
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users

  #get 'stocks/show_industries'

#  devise_scope :user do 
#  	get 'valet/sign_up' => 'users/registrations#valet_new'
#  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
