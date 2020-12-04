Rails.application.routes.draw do
  get 'welcome/index'

# This creates a nested resource within articles
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
