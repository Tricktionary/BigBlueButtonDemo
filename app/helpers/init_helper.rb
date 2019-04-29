module InitHelper
    def initialize_api
        url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://test-install.blindsidenetworks.com/bigbluebutton/') + 'api'
        secret = ENV['BIGBLUEBUTTON_SECRET'] || '8cd8ef52e8e101574e400365b55e11a6'
        version = 0.81

        BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, false)
    end
end
    