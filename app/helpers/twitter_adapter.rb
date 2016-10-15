helpers do
  def start_client
    if @client.is_a?(Twitter::Streaming::Client)
      return @client
    end
    @client = Twitter::Streaming::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token =  ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def individual_request
    if @client.is_a?(Twitter::Streaming::Client)
      return @client
    end
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token =  ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def trump_talk
    start_client
    count = 0

    @client.filter({:follow => '25073877', :locations => '-122.75,36.8,-121.75,37.8'}) do |object|
         Tweet.create!(username: object.to_h[:user][:screen_name], tweet: object.text, party: "R", lat: object.to_h[:geo][:coordinates][0], long: object.to_h[:geo][:coordinates][1]) if object.is_a?(Twitter::Tweet) && object.to_h[:geo] != nil
     count += 1
      if count > 300
        puts "added 300 tweets to DB"
        break
      end
    end
  end

  def clint_talk
    start_client
    @clint_RT_array = []
    @client.filter({:follow => '1339835893', :locations => '-122.75,36.8,-121.75,37.8'}) do |object|
      @clint_RT_array << object if object.is_a?(Twitter::Tweet) && object.place.id
      if @clint_RT_array.length > 20



        return @clint_RT_array
      end
    end
  end
end

def trump_stream
  @client.user({:with => '25073877'}) do |object|
   object if object.is_a?(Twitter::Tweet)
 end
end
def everything

  @client.sample do |object|
    puts object.text if object.is_a?(Twitter::Tweet)
  end
end


