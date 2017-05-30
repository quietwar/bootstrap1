Rails.application.routes.draw do

  devise_for :admins, controllers:{ :sessions => 'admins/sessions'},
    path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout'  }
  devise_for :user
  root "startups#index"



    resources :projects
        post :search, to: 'projects#search'

    resources :users, only: [:index] do
        resources :chatrooms do
          resources :messages, only: [:index, :show]
            resources :personal_messages, only: [:new, :create]

    mount ActionCable.server => '/cable'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  end
end
