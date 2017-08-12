require 'jumpstart_auth'
require 'yaml'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "EFpU9qFZl4troAY0tozYg0Vn8"
  config.consumer_secret     = "Etl4vcr6CxQbT4u8MBtor7baVSojhOdwmacljFWAb7E5iweOkH"
  config.access_token        = "882558666-rny8gBkjofnWXELke410GFB7JdEpisw1SSFlRkiS"
  config.access_token_secret = "VN9yZs5bat6l7bL3p59Nb8ZGja1SSJaBYNxUFJKYps9KK"
end

#twitter_pin = 0413947

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = client
  end

  # def tweet(message)
  #   @client.update(message)
  # end
end

# blogger = MicroBlogger.new
# blogger.tweet("90% of success is showing up")
