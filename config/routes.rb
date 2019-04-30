Rails.application.routes.draw do
  #Set root of the application to be index view 
  root :to => "core#index"

  #POST REQUEST 
  post "create_and_join_meeting" => "core#create_and_join_meeting"
 end
