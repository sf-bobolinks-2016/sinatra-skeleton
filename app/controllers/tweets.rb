get '/app' do
   @map_key=ENV['MAP_KEY']
   # trump_talk

  erb :"tweets/app"
end




