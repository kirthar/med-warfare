MedWarfare::Application.routes.draw do

  get "home/index"
  root :to => 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :combats do
    get 'unit/:unit_id', to: 'combats#turn', on: :member, as: 'turn_unit'
    resources :units, only: :none do
      post :use_skill, on: :member
    end
    resources :users, only: :none do
      get :join_to_combat, on: :member
      get :send_challange, on: :member
      delete :leave_combat, on: :member
    end

    get 'victory', on: :member
  end

  resources :combat_actions

  resources :units do
    get :skillset, on: :member
  end

  resources :unit_images, only: :destroy
  resources :users
  resources :friendships
end
