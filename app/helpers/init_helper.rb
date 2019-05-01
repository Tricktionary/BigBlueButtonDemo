module InitHelper
    def initialize_api
        url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://test-install.blindsidenetworks.com/bigbluebutton/api') 
        secret = ENV['BIGBLUEBUTTON_SECRET'] || '8cd8ef52e8e101574e400365b55e11a6'
        version = 0.81

        BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, false)
    end
end

## MY DOCKER CREDENTIALS
## url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://172.17.0.1/bigbluebutton/api') 
## secret = ENV['BIGBLUEBUTTON_SECRET'] || '5d371785dc1c91c57a9115478cf82aa0'