Mjweb::Engine.routes.draw do
  namespace :mjweb do
    get 'website/index'
  end
  
  resources :websites, :only => [:index]
  resources :settings, :only => [:index]
  resources :details, :only => [:edit, :update]
  resources :contents
  resources :images

end
