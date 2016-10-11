get '/session-viewer' do
  session.inspect
end

get '/login' do
  erb :"users/login"
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect '/'
  else
   erb :"login"
  end
end

get '/log_out' do
  session.delete(:id)
  redirect '/'
end
