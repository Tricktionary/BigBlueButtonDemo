require 'bigbluebutton_api'

class CoreController < ApplicationController
  include InitHelper

  ## Calls helper function to initialize the API
  def initialize
    super 
    @@api = initialize_api
  end

  ## required index function to load page
  def index
    recordings_json = @@api.get_recordings[:recordings]
    
    recordings_objects = []
    for recording in recordings_json
      recording_object = {}

      recording_url = recording[:playback][:format][:url]
      recording_id = recording[:recordID]

      recording_object['id'] = recording_id
      recording_object['url'] = recording_url

      recordings_objects.push(recording_object)
     end
    @recordings = recordings_objects
  end

  def delete_recording()
    puts request.params[:recording_id]
    @@api.delete_recordings(request.params[:recording_id])
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
