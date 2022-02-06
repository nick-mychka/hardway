Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :marathons, only: [:index, :show, :create, :destroy] do
    member do
      get :boards, path: '/boards'
    end
  end

  resources :boards, only: [:index, :show, :create, :destroy] do
    member do
      get :board_items, path: '/items'
    end
    collection do
      get :active_boards, path: '/active'
    end
  end
  resources :items, only: [:index, :create, :destroy, :update]
end
