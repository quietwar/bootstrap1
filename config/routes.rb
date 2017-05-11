Rails.application.routes.draw do
  devise_for :admins, controllers:{ :sessions => 'admins/sessions'},
    path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout'  }

  #namespace :admin do

    root "startups#index"

    resources :users, only: [:index] do
      resources :projects
        post :search, to: 'projects#search'
  end

      namespace :admin do
        resources :sessions
      end

      resources :chatrooms, only: [:new, :create, :show, :index] do
        resources :messages, only: [:index, :show]
          resources :personal_messages, only: [:new, :create]
devise_for :users, :controllers => { registration: 'registrations' }

    mount ActionCable.server => '/cable'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  devise_for :users, :controllers => { registration: 'registrations' }
end
