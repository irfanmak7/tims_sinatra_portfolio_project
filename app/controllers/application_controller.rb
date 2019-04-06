class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "tims_app"
    end
    get '/' do 
        erb :index
        #welcome
    end
    
    helpers do

        def redirect_if_not_logged_in
            if !logged_in?
              redirect "/login"
            end
        end
      
        def logged_in?
            !!current_user
        end
      
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
        
        def logout!
            session.clear
            redirect '/login'
            # Able to add additional feature when logging out i.e. Emailing user to let them know they logged out.
        end

    end

end