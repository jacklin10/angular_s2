AngularS2::Application.routes.draw do

  # devise_for :users, :controllers => {registrations: "my_devise/registrations",
  #    confirmations: "my_devise/confirmations" }

  devise_for :users

  # allow /sign_in vs /users/sign_in
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end

  resources :customers do

    collection do
      get :lookup_customer
    end

  end

  resources :home, :only=>[:index]
  resources :login,:only=>[:index]

  # high_voltage
  match '/:id' => 'pages#show', :as => :static, :via => :get

  root :to => 'pages#show', :id => 'index'
end
