require 'rails_helper'

RSpec.describe CoreController, type: :controller do
    
     describe "GET /" do
        it "Render the index template" do
            get :index
            expect(response.status).to render_template("index")
        end
    end

     describe "POST /create_and_join_meeting" do 
        it "Redirect user after creating a meeting" do 
            params = {
                meeting_id:"123",
                meeting_name:"test_meeting",
                username:"test_user",
                password:"password1234"
            }
            post :create_and_join_meeting, params: params
            expect((response).status).to eq(302)
        end
    end 

    describe "Test recording functionality" do
        it "Get recordings" do
            expect(controller.get_recordings()).to_not be_nil #Get an array object back
        end 
        it "Delete recording" do
            recordings = controller.get_recordings()
            if recordings.length > 0 
                
                id = recordings[0]["id"]
                
                params={
                    recording_id: id
                }
                
                #Mock the response
                allow(controller).to receive(:delete_recording).and_return({ :returncode => true, :deleted => true })
 
                post :delete_recording, params: params
                expect(controller.delete_recording()[:deleted]).to eql(true)
            end 
        end
    end 

end
