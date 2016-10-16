get '/app' do
   @map_key=ENV['MAP_KEY']
   # trump_talk


 #  @coords_collection = []
 #   @trump_RT_array.each do |object|
 #       @coords_collection << [object.coordinates.longitude, object.coordinates.latitude]
 # end


 # @coords_collection = []


  # @trump_RT_array.each do |obj|
  #    if obj.attrs[:coordinates][:coordinates] != nil
  #    @coords_collection << obj.attrs[:coordinates][:coordinates]
  #  end
  # end
  #  p @coords_collection
  erb :"tweets/app"
end




