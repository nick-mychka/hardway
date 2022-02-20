Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :marathons, only: [:index, :show, :create, :destroy] do
    member do
      get :boards
    end
  end

  resources :boards, only: [:index, :show, :create, :destroy] do
    resources :items, only: [:index, :create, :destroy, :update]

    collection do
      get :todays_boards
      get :standalone_boards
    end
  end
end
