Mjweb::Engine.routes.draw do


  resources :helps

#match 'users/me' => 'users#me', :via => :get 
  resources :fonts

  resources :backgrounds


  resources :abouts
  resources :services
  resources :images, :only => [:index, :new, :create, :destroy]
  resources :imagesettings, :only => [:show, :new, :create, :destroy] do
    get :list, :on => :member
  end
      
  resources :websites, :only => [:index]
  
  resource :websites do
    get :about, :on => :member
    get :service, :on => :member
  end

  resources :settings, :only => [:index]
  resources :hours, :only => [:edit, :update]
  resources :details, :only => [:edit, :update]
  resources :designs, :only => [:edit, :update]

  resources :contents do
    get :move, :on => :member
  end
  
end
