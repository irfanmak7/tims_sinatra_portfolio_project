class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :view, 'app/views'
        enable :sessions
        set :sessions_secret, "tims_app"
    end
    
    get '/' do
        "Hello World"
    end

    helpers do

    end

end