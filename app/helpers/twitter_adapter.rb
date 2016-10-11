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

  def trump_talk
    start_client
    @client.filter({:follow => '25073877'}) do |object|

      puts object if object.is_a?(Twitter::Tweet)
    end
  end

  def trump_stream
    start_client
    @client.user({:with => '25073877'}) do |object|
      puts object if object.is_a?(Twitter::Tweet)
     end
  end
  def everything
    start_client
    @client.sample do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end
  end
end

