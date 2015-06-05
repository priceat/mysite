Rails.application.routes.draw do
  root 'welcome#index'
  get "blog/1" => 'blogs#show'

  resources :blogs
end
