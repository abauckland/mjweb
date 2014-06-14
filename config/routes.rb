Mjweb::Engine.routes.draw do
  namespace :mjweb do
  get 'website/show'
  end

  resources :images

  resources :details

  resources :settings

end
