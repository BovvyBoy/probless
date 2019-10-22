require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "probless"
    #use Rack::Flash
  end

  get "/" do
    erb :welcome
  end




  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def authenticate
      if !logged_in?
        erb :'/login'
      end
    end

    def authorise(problem)
      if problem.user_id != current_user
        redirect '/'
      end
    end

  end

end
