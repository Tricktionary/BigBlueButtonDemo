[![CircleCI](https://circleci.com/gh/Tricktionary/BigBlueButtonDemo.svg?style=svg)](https://circleci.com/gh/Tricktionary/BigBlueButtonDemo)

# BigBlueButtonDemo

This is a [rails](https://rubyonrails.org/) app that show's the capabilities of the ruby [gem](https://rubygems.org/gems/bigbluebutton-api-ruby/versions/1.7.0)

### How to run

1. clone the repo `git clone https://github.com/Tricktionary/BBB-Demo`
2. Be on `ruby 2.6.1`
3. Have an instance of BigBlueButton running on a Docker container. Follow this [tutorial](http://docs.bigbluebutton.org/install/docker.html) in order to get a container running.
4. Modify `app/helper/initialize_helper.rb` to have the proper credentials for `BIGBLUEBUTTON_ENDPOINT` and `BIGBLUEBUTTON_SECRET`. These credentials are aquired when booting up the docker container for the first time. To aquire theses credentials again 
    -  Go into your docker instance of BigBlueButton by running the commmand `docker exec -it <DOCKER_ID_OF_BBB> /bin/bash`
    - run `bbb-conf --secret` and you should see your credentials
5. run `bundle install`
6. run `rails s`



 
