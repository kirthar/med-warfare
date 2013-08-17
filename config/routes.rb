MedWarfare::Application.routes.draw do

  get "home/index"
  root :to => 'home#index'
  devise_for :users

  resources :combats do
    resources :units, only: :none do
      post :use_skill, on: :member
    end
    resources :users, only: :none do
      get :join_to_combat, on: :member
      get :send_challange, on: :member
      delete :leave_combat, on: :member
    end
  end

  resources :combat_actions

  resources :units do
    get :skillset, on: :member
  end

  resources :unit_images, only: :destroy

end
