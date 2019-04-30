require 'bigbluebutton_api'

class CoreController < ApplicationController
  include InitHelper

  ## required index function to load page
  def index
    puts 'Homepage'
  end

  ## Calls helper function to initialize the API
  def initialize
    super 
    @@api = initialize_api
  end

  ## Create meeting
  def create_meeting(meeting_name,meeting_id,password)
    #Default params pulled from the api docs
    options = {
      :attendeePW => password,
      :moderatorPW => "123",
      :welcome => "Whats up!",
      :dialNumber => 5190909090,
      :voiceBridge => 76543,
      :logoutURL => "http://mconf.org",
      :record => true,
      :duration => 100000,
      :maxParticipants => 25,
      :meta_category => "Remote Class"
    }
    @@api.create_meeting(meeting_name,meeting_id,options)
  end 

  ## Join meeting
  def join_meeting(meeting_id,username,password)
    url = @@api.join_meeting_url(meeting_id,username,password)
    redirect_to url
  end 

  ## Create and join meeting
  def create_and_join_meeting
    meeting_id = request.params[:meeting_id]
    meeting_name = request.params[:meeting_name]
    username = request.params[:username]
    password = request.params[:password]

    if @@api.is_meeting_running?(meeting_id)
       join_meeting(meeting_id,username,password)
    else
      create_meeting(meeting_name,meeting_id,password)
      join_meeting(meeting_id,username,'123')
    end
  end

end
