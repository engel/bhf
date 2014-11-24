Bhf::Engine.routes.draw do
  
  root to: 'application#index'
  
  get 'page/:page', to: 'pages#show', as: :page
  
  scope ':platform' do
    resources :entries, except: [:index] do
      put :sort, on: :collection
      put :embed_sort, on: :member
      post :duplicate, on: :member
      
      resources :embed_entries, except: [:index], as: :embed
    end
  end

end
