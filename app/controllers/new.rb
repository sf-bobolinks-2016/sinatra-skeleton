get '/users/new' do
  puts ":in users/new:"
  erb :"users/new"
end

get '/users' do
  @users = User.all
  erb :'users/index'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:hashed_password]
  if @user.save
    redirect '/'
  else
    erb :"users/new"
  end
end
