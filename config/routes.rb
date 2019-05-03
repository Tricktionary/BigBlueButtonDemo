Rails.application.routes.draw do
    
  post "create_and_join_meeting" => "core#create_and_join_meeting"
  post "delete_recording" => "core#delete_recording"
  post "join_meeting" => "core#join_meeting"

  get "create" => "core#create"
  get "join" => "core#join"

  root "core#index"
 end
