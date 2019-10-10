class SessionController < ApplicationController
#log in
  get '/login' do
    erb :"sessions/login"
  end

#put in session
  post '/sessions' do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect "/problems"
      else
        redirect "/login"
      end
  end

#log out
  get '/logout' do
    session.clear
    redirect "/"
  end

end
