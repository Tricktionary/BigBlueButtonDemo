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
    ##Create the room if as a safety measure
    create_room(request.params[:username],request.params[:room_id]) 
  end 

  ## Create Room for user to join
  def create_room(username,room_id)
    meeting_name = username+ "'s room"
    meeting_id = room_id
    options = {
      moderatorPW: ENV['DEMO_MP'] || 'mp',
      attendeePW: ENV['DEMO_AP'] || 'ap',
      record: false,
      autoStartRecording: false,
      logoutURL: root_url
    }

    if @@api.is_meeting_running?(meeting_id)
      puts "The meeting is already running"
    else
      @@api.create_meeting(meeting_name, meeting_id, options)
      puts "Just created the meeting"
      return true
    end 
  end

  ## Join Room based on parameter given
  def join_room(username,password,id)
  
  end 

  ## required index function to load page
  def index
    puts 'Homepage'
  end

end
