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
  def create_meeting(meeting_name,meeting_id)
    options = {
      :attendeePW => "321",
      :moderatorPW => "123",
      :welcome => "Welcome here!",
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
    url = @@api.join_meeting_url(meeting_id,username,'123')
    redirect_to url
  end 

  ## Create and join meeting
  def create_and_join_meeting
    create_meeting(request.params[:meeting_name],request.params[:meeting_id])
    join_meeting(request.params[:meeting_id],'Test','123')
  end

end
