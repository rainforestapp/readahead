Readahead::Application.routes.draw do
  resources :links do
  end
  resources :lists do
  end
  resources :users do
    collection do
      post 'login'
    end
  end
end
