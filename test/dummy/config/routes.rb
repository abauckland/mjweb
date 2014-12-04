Rails.application.routes.draw do

  mount Mjweb::Engine => "/mjweb"
  
  resources :dashboards, :only => [:index]
   
end
