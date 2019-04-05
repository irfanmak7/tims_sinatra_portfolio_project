class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "tims_app"
    end
    

    helpers do

        def logged_in?
            !!session[:email]
        end

        def login(email)
            # Is the user who they claim to be
            session[:email] = email
        end

        def logout!
            session.clear
            redirect '/login'
            # Able to add additional feature when logging out i.e. Emailing user to let them know they logged out.
        end

    end

end