Rails.application.routes.draw do
  #Set root of the application to be index view 
  root :to => "core#index"

  #POST REQUEST 
  post "create" => "core#create_and_join"
  
end
