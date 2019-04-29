require 'bigbluebutton_api'

class CoreController < ApplicationController
  include InitHelper

  ## Calls helper function to initialize the API
  def initialize
    super 
    @@api = initialize_api
  end 

  ## Create of join meeting 
  def create_and_join_room
  end 

  ## Create Room for user to join
  def create_room(room_id)
    
  end

  ## Join Room based on parameter given
  def join_room(username,password,id)
  
  end 

  ## reuired index function
  def index
    puts 'Homepage'
  end

end
