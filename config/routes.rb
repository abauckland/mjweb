Mjweb::Engine.routes.draw do
 
  resources :fonts

  resources :backgrounds

  namespace :mjweb do

  end

  resources :abouts
  resources :services
  resources :images, :only => [:index, :new, :create, :destroy]
  resources :imagesettings, :only => [:new, :create, :destroy] do
    get :list, :on => :member
  end
      
  resources :websites, :only => [:index] do
    get :about, :on => :member
    get :service, :on => :member
  end
  resources :settings, :only => [:index]
  resources :hours, :only => [:edit, :update]
  resources :details, :only => [:edit, :update]
  resources :design, :only => [:edit, :update]

  resources :contents do
    get :move, :on => :member
  end
  
end
