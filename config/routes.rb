MedWarfare::Application.routes.draw do

  get "home/index"
  root :to => 'home#index'
  devise_for :users



  resources :combats do
    resources :units do
      post :use_skill, on: :member
    end
  end
  resources :combat_actions

  resources :units do
    get :skillset, on: :member
  end

  resources :unit_images, only: :destroy

end
