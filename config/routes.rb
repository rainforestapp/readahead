Readahead::Application.routes.draw do
  resources :lists do
  end
  resources :users do
    collection do
      post 'login'
    end
  end
end
