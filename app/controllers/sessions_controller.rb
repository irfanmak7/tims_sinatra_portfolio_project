class SessionsController < ApplicationController

    get '/login'
        erb :"sessions/login.html"
    end

end