Rails.application.routes.draw do
    
  post "create_and_join_meeting" => "core#create_and_join_meeting"
  post "delete_recording" => "core#delete_recording"

  root "core#index"
 end
