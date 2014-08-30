Mjweb::Engine.routes.draw do

  resources :webpages
  resources :trainings
  resources :networkings
  resources :books
  resources :banks
  resources :products
  resources :events

  resources :abouts
  resources :services

  resources :helps

#match 'users/me' => 'users#me', :via => :get 
  resources :fonts

  resources :backgrounds
  
  resources :images, :only => [:index, :new, :create, :destroy]
  resources :imagesettings, :only => [:show, :new, :create, :destroy] do
    get :list, :on => :member
  end
      
  resources :websites, :only => [:index]
  
  resource :websites do
    get :about, :on => :member
    get :service, :on => :member
    get :bank, :on => :member
    get :book, :on => :member
    get :event, :on => :member
    get :networking, :on => :member
    get :product, :on => :member
    get :training, :on => :member            
    get :webpage, :on => :member
  end

  resources :settings, :only => [:index]
  resources :hours, :only => [:edit, :update]
  resources :details, :only => [:edit, :update]
  resources :designs, :only => [:edit, :update]

  resources :contents do
    get :move_up, :on => :member
    get :move_down, :on => :member
  end
  
end
