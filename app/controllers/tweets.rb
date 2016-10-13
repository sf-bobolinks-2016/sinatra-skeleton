get '/app' do
 #   @map_key=ENV['MAP_KEY']
 #   trump_talk
 #   @trump_RT_array.delete_if {|object| object.place == "null"}
 #   clint_talk
 #   @clint_RT_array.delete_if {|object| object.place == "null"}
 #   erb :"tweets/app"
 #  @coords_collection = []
 #   @trump_RT_array.each do |object|
 #       @coords_collection << [object.coordinates.longitude, object.coordinates.latitude]
 # end
  trump_talk
  # puts mention[:entities][:user_mentions][0][:screen_name]
@coords_collection = []
 @trump_RT_array.delete_if{|obj| obj.attrs[:coordinates] == nil}

  @trump_RT_array.each do |obj|
     @coords_collection<<obj.attrs[:coordinates][:coordinates]
  end
 p @coords_collection

end




