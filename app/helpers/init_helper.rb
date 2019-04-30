module InitHelper
    def initialize_api
        url = (ENV['BIGBLUEBUTTON_ENDPOINT'] || 'http://172.17.0.1/bigbluebutton/api') 
        secret = ENV['BIGBLUEBUTTON_SECRET'] || '5d371785dc1c91c57a9115478cf82aa0'
        version = 0.81

        BigBlueButton::BigBlueButtonApi.new(url, secret, version.to_s, false)
    end
end

#docker run -p 80:80/tcp -p 1935:1935 -p 5066:5066 -p 3478:3478 -p 3478:3478/udp --name bigbluebutton bigbluebutton/bigbluebutton -h 172.17.0.1