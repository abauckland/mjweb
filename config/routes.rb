Mjweb::Engine.routes.draw do

  resources :websites, :only => [:index] do
    get :event, :on => :member
    get :plan, :on => :member
  end

#match 'users/me' => 'users#me', :via => :get 
  resources :fonts, :only => [:index, :new, :create, :destroy]
  resources :backgrounds, :only => [:index, :new, :create, :destroy]
  resources :icons, :only => [:index, :new, :create, :destroy]

  resources :linktiles, :only => [:edit, :update]  do
    get :edit_detail, :on => :member
  end
  
  resources :pages
  
  resources :infos do
    get :move_up, :on => :member
    get :move_down, :on => :member
  end
  
  resources :images, :only => [:index, :new, :create, :destroy]
  resources :imagesettings, :only => [:show, :new, :create, :destroy] do
    get :list, :on => :member
  end
  
  resources :details, :only => [:edit, :update]
  resources :designs, :only => [:edit, :update]
  resources :hours, :only => [:edit, :update]
  resources :events
  resources :plans
  
  resources :contents do
    get :move_up, :on => :member
    get :move_down, :on => :member
  end
  
end
